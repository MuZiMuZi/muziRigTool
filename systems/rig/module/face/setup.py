# coding=utf-8
u"""面部生成入口：模型校验 + 定位器补齐（步骤 1 / 2）。

职责边界：

    本文件只负责「把定位器准备齐、把参数校验对」，
    不建绑定、不碰权重。绑定由 face/* 各模块负责。

步骤 1 的输入（由使用者提供）：

    head_mesh      头部模型
    eye_meshes     左右眼球模型
    teeth_meshes   上下牙床模型
    tongue_mesh    舌头模型
    mouth_mesh     口腔模型
    lip_count      嘴唇关节点数量，必须是 4 的倍数

步骤 2：模板里已经有 brow / eye / lid / lip / nose / jaw / teeth /
tongue / zygoma / ear 的定位器；缺 pucker / squint / cheek / stretch，
这里按已有定位器的位置补出来，位置只是起点，导入后可拖。
"""

from maya import cmds

from .....core.name_utils import Name
from .....systems.rig.guide import Guide


# 嘴唇关节数必须是 4 的倍数（按模型布线调整）
LIP_COUNT_STEP = 4

# 模板里已经有、不用补的部位
TEMPLATE_PARTS = (
    "brow", "eye", "lid", "eye_bag", "lip", "nose", "jaw",
    "teeth", "tongue", "zygoma", "ear",
)


def validate_lip_count(count):
    u"""校验嘴唇关节数量。

    Args:
        count (int): 关节数量。

    Returns:
        int: 校验通过的数量。

    Raises:
        ValueError: 少于 8 或不是 4 的倍数。
    """

    count = int(count)

    if count < 8:
        raise ValueError(
            u"嘴唇关节数至少 8，收到：{}".format(count)
        )

    if count % LIP_COUNT_STEP:
        raise ValueError(
            u"嘴唇关节数必须是 {} 的倍数，收到：{}".format(
                LIP_COUNT_STEP, count
            )
        )

    return count


def validate_models(config):
    u"""校验步骤 1 的模型是否都在场景里。

    Args:
        config (dict): head_mesh / eye_meshes / teeth_meshes /
            tongue_mesh / mouth_mesh / lip_count。

    Returns:
        dict: 校验后的配置。

    Raises:
        ValueError: 必填项缺失。
        RuntimeError: 模型不存在。
    """

    required = (
        "head_mesh", "eye_meshes", "teeth_meshes",
        "tongue_mesh", "mouth_mesh",
    )

    for key in required:
        if not config.get(key):
            raise ValueError(u"缺少输入：{}".format(key))

    models = [config["head_mesh"], config["tongue_mesh"],
              config["mouth_mesh"]]
    models.extend(config["teeth_meshes"])
    models.extend(config["eye_meshes"])

    for node in models:
        if not cmds.objExists(node):
            raise RuntimeError(u"模型不存在：{}".format(node))

    config = dict(config)
    config["lip_count"] = validate_lip_count(config.get("lip_count", 8))

    return config


class FaceSetup(object):
    u"""面部定位器的准备工作。"""

    def __init__(self, guide=None):
        self.guide = guide or Guide("face")

    # ------------------------------------------------------------------
    # 模板
    # ------------------------------------------------------------------

    def prepare(self):
        u"""导入模板并补齐缺失定位器。

        Returns:
            dict: 各部位的定位器（名字或列表）。
        """

        self.guide.import_template()
        self.ensure_extra_locators()

        return self.collect()

    # ------------------------------------------------------------------
    # 补定位器
    # ------------------------------------------------------------------

    def ensure_extra_locators(self):
        u"""补 pucker / squint / cheek / stretch 定位器。"""

        parent = self.guide.get_face_move()
        anchor = self._anchor()

        created = []

        created.extend(self._ensure_point(
            Name(type="loc", side="md", part="pucker",
                 function="bind", index=1).name,
            [anchor[0], anchor[1] - 30.0, anchor[2] + 20.0],
            parent
        ))

        for side in ("lf", "rt"):
            sign = 1.0 if side == "lf" else -1.0
            cheek_anchor = self.guide.get_face_zygoma(side)

            base = (
                cmds.xform(cheek_anchor[1], query=True, worldSpace=True,
                           translation=True)
                if cheek_anchor else anchor
            )

            created.extend(self._ensure_point(
                Name(type="loc", side=side, part="squint",
                     function="bind", index=1).name,
                [base[0] + sign * 6.0, base[1] + 8.0, base[2] + 4.0],
                parent
            ))
            created.extend(self._ensure_point(
                Name(type="loc", side=side, part="cheek",
                     function="bind", index=1).name,
                [base[0] + sign * 18.0, base[1] - 6.0, base[2] - 6.0],
                parent
            ))

            for function, offset in (
                ("front", (0.0, 12.0, 10.0)),
                ("back", (0.0, 12.0, -18.0)),
            ):
                for index in range(1, 4):
                    created.extend(self._ensure_point(
                        Name(
                            type="loc", side=side, part="stretch",
                            function=function, index=index
                        ).name,
                        [
                            base[0] + sign * (index * 4.0) + offset[0],
                            base[1] + offset[1],
                            base[2] + offset[2],
                        ],
                        parent
                    ))

        return created

    def _anchor(self):
        u"""补定位器时的参考点：鼻子中心。"""

        nose = self.guide.get_face_nose_center()

        if nose:
            return cmds.xform(
                nose, query=True, worldSpace=True, rotatePivot=True
            )

        move = self.guide.get_face_move()

        return cmds.xform(
            move, query=True, worldSpace=True, rotatePivot=True
        )

    def _ensure_point(self, name, position, parent):
        u"""不存在才创建，已存在直接返回。"""

        if cmds.objExists(name):
            return [name]

        node = cmds.spaceLocator(name=name)[0]
        cmds.xform(node, worldSpace=True, translation=position)

        if parent and cmds.objExists(parent):
            cmds.parent(node, parent, absolute=True)

        return [node]

    # ------------------------------------------------------------------
    # 汇总
    # ------------------------------------------------------------------

    def collect(self):
        u"""把所有定位器收集成一个字典，方便后续模块取用。"""

        result = {
            "move": self.guide.get_face_move(),
            "jaw": self.guide.get_face_jaw(),
            "jaw_end": self.guide.get_face_jaw_end(),
            "nose": self.guide.get_face_nose(),
            "nose_center": self.guide.get_face_nose_center(),
            "muzzle": self.guide.get_face_muzzle(),
            "pucker": self.guide.get_face_single(
                "loc_md_pucker_bind_001"
            ),
            "lip_upper": self.guide.get_face_lip_curve("upper"),
            "lip_lower": self.guide.get_face_lip_curve("lower"),
        }

        for side in ("lf", "rt"):
            result[side] = {
                "eye": self.guide.get_face_eye(side),
                "eye_aim": self.guide.get_face_eye_aim(side),
                "brow": self.guide.get_face_brow_bind(side),
                "brow_main": self.guide.get_face_brow_main(side),
                "brow_curve": self.guide.get_face_brow_curve(side),
                "lid_upper": self.guide.get_face_lid_bind(side, "upper"),
                "lid_lower": self.guide.get_face_lid_bind(side, "lower"),
                "lip_upper": self.guide.get_face_lip_bind(side, "upper"),
                "lip_lower": self.guide.get_face_lip_bind(side, "lower"),
                "mouth_corner": self.guide.get_face_mouth_corner(side),
                "squint": self.guide.get_face_single(
                    "loc_{}_squint_bind_001".format(side)
                ),
                "cheek": self.guide.get_face_single(
                    "loc_{}_cheek_bind_001".format(side)
                ),
                "stretch_front": [
                    self.guide.get_face_single(
                        "loc_{}_stretch_front_bind_{:03d}".format(side, i)
                    )
                    for i in range(1, 4)
                ],
                "stretch_back": [
                    self.guide.get_face_single(
                        "loc_{}_stretch_back_bind_{:03d}".format(side, i)
                    )
                    for i in range(1, 4)
                ],
            }

        return result
