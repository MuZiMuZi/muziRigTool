# coding=utf-8
u"""面部生成流程：模型 → 定位器 → 三层头 → 基础绑定。

用法（示例）：

    from muziRigTool.systems.rig.module.face.build import FaceBuild

    builder = FaceBuild({
        "head_mesh": "mesh_md_face_source_001",
        "eye_meshes": ["mesh_lf_eye_001", "mesh_rt_eye_001"],
        "teeth_meshes": ["mesh_md_teeth_upper_001", "mesh_md_teeth_lower_001"],
        "tongue_mesh": "mesh_md_tongue_001",
        "mouth_mesh": "mesh_md_mouth_001",
        "lip_count": 8,
    })
    result = builder.build()

流程：

    1. 校验模型 + 嘴唇关节数（4 的倍数）
    2. 导入 face_guide.ma，补齐 pucker / squint / cheek / stretch 定位器
    3. 建两层头（tweak + 修型 + stretch 一个 BS 双目标）
    4. 建 pin 头（只跟挤压拉伸，无环）
    5. 建 jaw / eye / brow（可选把 brow 控制器钉到 pin 头）

蒙皮权重仍然手刷；stretch 刷完权重后调 sync_pin_skin() 把权重同步给 pin 头。
"""

from maya import cmds

from .heads import (
    build_heads,
    build_pin_head,
    copy_skin_weights,
    delete_heads,
)
from .setup import FaceSetup, validate_models


class FaceBuild(object):
    u"""一次把面部基础结构建起来。"""

    def __init__(self, config, side="lf", build_brows=True,
                 build_eyes=True, build_jaw=True, build_lids=True,
                 pin_brows=False):
        self.config = validate_models(config)
        self.side = side
        self.build_brows = build_brows
        self.build_eyes = build_eyes
        self.build_jaw = build_jaw
        self.build_lids = build_lids
        self.pin_brows = pin_brows

        self.locators = {}
        self.heads = {}
        self.pin = {}
        self.jaw = None
        self.eyes = {}
        self.lids = {}
        self.brows = {}

    # ------------------------------------------------------------------
    # 构建
    # ------------------------------------------------------------------

    def build(self):
        u"""按顺序建好全部基础结构。"""

        setup = FaceSetup()
        self.locators = setup.prepare()

        self.heads = build_heads(
            self.config["head_mesh"], layers="two_bs"
        )
        self.pin = build_pin_head(self.heads["stretch"])

        if self.build_jaw:
            self.jaw = self._build_jaw()

        if self.build_eyes:
            for side in ("lf", "rt"):
                self.eyes[side] = self._build_eye(side)

        if self.build_lids:
            for side in ("lf", "rt"):
                self.lids[side] = self._build_lid(side)

        if self.build_brows:
            for side in ("lf", "rt"):
                self.brows[side] = self._build_brow(side)

        return {
            "locators": self.locators,
            "heads": self.heads,
            "pin": self.pin,
            "jaw": self.jaw,
            "eyes": self.eyes,
            "lids": self.lids,
            "brows": self.brows,
        }

    def _build_jaw(self):
        from .jaw import Jaw

        guide = self.locators
        jaw = Jaw(
            side="md",
            guides=[guide["jaw"], guide["jaw_end"]],
        )
        jaw.delete_rig()
        jaw.build_rig()
        jaw.connect_rig()

        return jaw

    def _build_eye(self, side):
        from .eye import Eye

        data = self.locators[side]
        eye = Eye(side=side, guides=[data["eye"], data["eye_aim"]])
        eye.delete_rig()
        eye.build_rig()
        eye.connect_rig()

        return eye

    def _build_lid(self, side):
        from .lid import Lid
        from ...guide import Guide

        guide = Guide("face")
        data = self.locators[side]

        lid = Lid(
            side=side,
            upper=data["lid_upper"],
            lower=data["lid_lower"],
            inner=guide.get_face_lid_corner(side, "inner"),
            outer=guide.get_face_lid_corner(side, "outer"),
            eye=data["eye"],
        )
        lid.delete_rig()
        lid.build_rig()
        lid.connect_rig()

        return lid

    def _build_brow(self, side):
        from .brow import Brow

        data = self.locators[side]

        brow = Brow(
            side=side,
            guides=data["brow"],
            main_guide=data["brow_main"],
            panel=True,
            reference_mesh=self.pin["pin"] if self.pin_brows else None,
        )
        brow.delete_rig()
        brow.build_rig()
        brow.connect_rig()

        return brow

    # ------------------------------------------------------------------
    # 维护
    # ------------------------------------------------------------------

    def sync_pin_skin(self):
        u"""stretch 刷完权重后，把权重同步给 pin 头。"""

        if not self.heads or not self.pin:
            raise RuntimeError(u"还没有建三层头，先 build()")

        return copy_skin_weights(
            self.heads["stretch"], self.pin["pin"]
        )

    def delete(self):
        u"""删掉模块和三张头。"""

        for brow in self.brows.values():
            brow.delete_rig()

        for lid in self.lids.values():
            lid.delete_rig()

        for eye in self.eyes.values():
            eye.delete_rig()

        if self.jaw:
            self.jaw.delete_rig()

        if self.pin.get("pin") and cmds.objExists(self.pin["pin"]):
            cmds.delete(self.pin["pin"])

        delete_heads()

        self.jaw = None
        self.eyes = {}
        self.lids = {}
        self.brows = {}
        self.pin = {}
        self.heads = {}
