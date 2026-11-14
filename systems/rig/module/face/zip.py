# coding=utf-8
u"""拉链嘴（zip）面片：用嘴唇定位器生成，不依赖选边。

流程：

    上唇定位器（按 X 排序） ──degree 3 曲线──┐
                                            ├─ 采样 count+1 个点
    下唇定位器（按 X 排序） ──degree 3 曲线──┘
                                            ▼
                       多边形带（2 行 × count 段），UV 0~1 横向铺开
                                            ▼
                       uvPin / 毛囊 按 u = i / count 放点

zip 属性（0-1）沿 U 方向推进，控制每一段嘴唇依次闭合。
"""

from maya import cmds

from .....core import uv_pin_utils


def _ordered_locators(locators):
    u"""按世界 X 从负到正排序（嘴左 → 嘴右）。"""

    ordered = []

    for node in locators:
        position = cmds.xform(
            node, query=True, worldSpace=True, rotatePivot=True
        )
        ordered.append((position[0], node))

    ordered.sort(key=lambda item: item[0])

    return [node for _, node in ordered]


def _curve_from_locators(name, locators, degree=3):
    u"""定位器世界坐标 → 曲线。"""

    points = [
        cmds.xform(node, query=True, worldSpace=True, rotatePivot=True)
        for node in locators
    ]

    return cmds.curve(point=points, degree=degree, name=name)


def _sample_curve(curve, count):
    u"""在曲线上等距采样 count+1 个点。"""

    points = []

    for index in range(count + 1):
        parameter = float(index) / count
        points.append(
            cmds.pointOnCurve(curve, parameter=parameter, position=True)
        )

    return points


def build_zip_patch(upper_locators, lower_locators, count=8,
                    name="mesh_md_lip_zip_001"):
    u"""用嘴唇定位器生成 zip 面片。

    Args:
        upper_locators (list): 上唇定位器（顺序随意，内部按 X 排序）。
        lower_locators (list): 下唇定位器。
        count (int): 分段数（嘴唇关节数，4 的倍数）。
        name (str): 面片名。

    Returns:
        dict: patch / 上曲线 / 下曲线 / 分段。
    """

    if count % 4:
        raise ValueError(
            u"分段数必须是 4 的倍数，收到：{}".format(count)
        )

    if cmds.objExists(name):
        cmds.delete(name)

    upper = _ordered_locators(upper_locators)
    lower = _ordered_locators(lower_locators)

    upper_curve = _curve_from_locators(
        "crv_md_lip_zip_upper_001", upper
    )
    lower_curve = _curve_from_locators(
        "crv_md_lip_zip_lower_001", lower
    )

    upper_points = _sample_curve(upper_curve, count)
    lower_points = _sample_curve(lower_curve, count)

    # 用 polyPlane 建带 UV 的网格，再把顶点挪到采样的位置
    patch = cmds.polyPlane(
        width=1.0, height=1.0,
        subdivisionsX=count, subdivisionsY=1,
        name=name
    )[0]

    vertices = cmds.ls(patch + ".vtx[*]", flatten=True)
    upper_row = vertices[:count + 1]
    lower_row = vertices[count + 1:]

    for vertex, position in zip(upper_row, upper_points):
        cmds.xform(vertex, worldSpace=True, translation=position)

    for vertex, position in zip(lower_row, lower_points):
        cmds.xform(vertex, worldSpace=True, translation=position)

    return {
        "patch": patch,
        "upper_curve": upper_curve,
        "lower_curve": lower_curve,
        "count": count,
    }


def add_zip_pins(patch, count, side="md", prefix="zip"):
    u"""沿面片 U 方向等距放 uvPin，返回定位器列表。

    每个定位器就是一段嘴唇的「缝合点」，后续用 zip 权重去驱动。
    """

    pins = []

    for index in range(count + 1):
        u_value = float(index) / count

        driver_name = "loc_{}_{}_{:03d}".format(prefix, side, index + 1)
        driver = cmds.spaceLocator(name=driver_name)[0]
        cmds.setAttr(driver + ".visibility", 0)

        # 放到面片上对应 U 的位置，uvPin 再从最近点采样
        position = cmds.pointOnSurface(
            patch, u=u_value, v=0.5, position=True
        )
        cmds.xform(driver, worldSpace=True, translation=position)

        result = uv_pin_utils.create_uv_pin(
            patch,
            driver,
            drive_group=True,
            output_mode=uv_pin_utils.OUTPUT_OFFSET_PARENT_MATRIX,
        )

        pins.append({
            "index": index,
            "u": u_value,
            "driver": driver,
            "group": result["group"],
            "node": result["node"],
        })

    return pins
