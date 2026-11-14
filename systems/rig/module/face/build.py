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
                 build_parts=True, pin_brows=False):
        self.config = validate_models(config)
        self.side = side
        self.build_brows = build_brows
        self.build_eyes = build_eyes
        self.build_jaw = build_jaw
        self.build_lids = build_lids
        self.build_parts = build_parts
        self.pin_brows = pin_brows

        self.locators = {}
        self.heads = {}
        self.pin = {}
        self.jaw = None
        self.eyes = {}
        self.lids = {}
        self.brows = {}
        self.parts = {}

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

        if self.build_parts:
            self._build_extra_parts()

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
            "parts": self.parts,
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

    def _build_chain_part(self, key, module, side, chains, **kwargs):
        from .chain_module import ChainedPart

        part = ChainedPart(side=side, chains=chains, module=module, **kwargs)
        part.delete_rig()
        part.build_rig()
        part.connect_rig()
        self.parts[key] = part

        return part

    def _build_extra_parts(self):
        u"""鼻子 / 脸颊 / 颧骨 / 下颚 / 耳朵 / 舌头 / 牙齿 / 拉伸 / 嘴唇。"""

        locators = self.locators

        # 鼻子：中线两节 + 口鼻 + 左右鼻翼
        self._build_chain_part(
            "nose", "nose", "md",
            [("nose", [locators["nose"], locators["nose_center"]])]
        )
        self._build_chain_part(
            "muzzle", "muzzle", "md",
            [("muzzle", [locators["muzzle"]])]
        )

        for side in ("lf", "rt"):
            data = locators[side]

            side_nose = data.get("nose_side")

            if side_nose:
                self._build_chain_part(
                    "nose_side_" + side, "nose_side", side,
                    [("nose_side", [side_nose])]
                )

            if data.get("cheek"):
                self._build_chain_part(
                    "cheek_" + side, "cheek", side,
                    [("cheek", [data["cheek"]])]
                )

            if data.get("squint"):
                self._build_chain_part(
                    "squint_" + side, "squint", side,
                    [("squint", [data["squint"]])]
                )

            if data.get("ear"):
                self._build_chain_part(
                    "ear_" + side, "ear", side,
                    [("ear", data["ear"])]
                )

            front = [
                item for item in data.get("stretch_front", []) if item
            ]
            back = [
                item for item in data.get("stretch_back", []) if item
            ]

            chains = []

            if front:
                chains.append(("stretch_front", front))
            if back:
                chains.append(("stretch_back", back))

            if chains:
                self._build_chain_part(
                    "stretch_" + side, "stretch", side, chains
                )

        if locators.get("pucker"):
            self._build_chain_part(
                "pucker", "pucker", "md",
                [("pucker", [locators["pucker"]])]
            )

        upper_teeth, lower_teeth = self._teeth_locators()

        if upper_teeth and lower_teeth:
            self._build_chain_part(
                "teeth", "teeth", "md",
                [("teeth_up", [upper_teeth]),
                 ("teeth_low", [lower_teeth])]
            )

        tongue = self._tongue_locators()

        if tongue:
            self._build_chain_part(
                "tongue", "tongue", "md", [("tongue", tongue)]
            )

        self._build_lips()

    def _teeth_locators(self):
        from ...guide import Guide

        guide = Guide("face")
        return guide.get_face_teeth()

    def _tongue_locators(self):
        from ...guide import Guide

        guide = Guide("face")
        return guide.get_face_tongue()

    def _build_lips(self):
        u"""嘴唇：左右各上/下两节 + 嘴角，中线各一节。"""

        from ...guide import Guide

        guide = Guide("face")

        for side in ("lf", "rt"):
            upper = self.locators[side].get("lip_upper", [])
            lower = self.locators[side].get("lip_lower", [])
            corner = guide.get_face_mouth_corner(side)

            chains = []

            if upper:
                chains.append(("lip_up", upper))
            if lower:
                chains.append(("lip_low", lower))
            if corner:
                chains.append(("lip_corner", [corner]))

            if chains:
                self._build_chain_part(
                    "lip_" + side, "lip", side, chains
                )

        upper_md = guide.get_face_lip_bind("md", "upper")
        lower_md = guide.get_face_lip_bind("md", "lower")

        chains = []

        if upper_md:
            chains.append(("lip_up", upper_md))
        if lower_md:
            chains.append(("lip_low", lower_md))

        if chains:
            self._build_chain_part("lip_md", "lip", "md", chains)

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

        for part in self.parts.values():
            part.delete_rig()

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
