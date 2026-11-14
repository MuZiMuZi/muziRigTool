# coding=utf-8
"""Test three-head chain: tweak -> corrective -> stretch."""
import os
import sys

SCRIPTS_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
if SCRIPTS_DIR not in sys.path:
    sys.path.insert(0, SCRIPTS_DIR)

import maya.standalone

maya.standalone.initialize(name="python")

from maya import cmds  # noqa: E402

from muziRigTool.systems.rig.module.face import heads  # noqa: E402

cmds.file(new=True, force=True)

head = cmds.polySphere(radius=5, name="mesh_md_face_source_001")[0]

names = heads.build_heads(head)
print("names:", names)

for key in ("tweak", "corrective", "stretch"):
    print(key, "exists:", cmds.objExists(names[key]))

# 移动 tweak 的一个顶点，stretch 应该跟着动
cmds.select(names["tweak"] + ".vtx[0]", replace=True)
cmds.move(0, 2, 0, relative=True)

tweak_pos = cmds.xform(names["tweak"] + ".vtx[0]", q=True, ws=True, t=True)
stretch_pos = cmds.xform(names["stretch"] + ".vtx[0]", q=True, ws=True, t=True)
print("tweak vtx:", [round(v, 2) for v in tweak_pos])
print("stretch vtx:", [round(v, 2) for v in stretch_pos])
print("follow:", round(stretch_pos[1] - tweak_pos[1], 3))

heads.delete_heads()
print("after delete:", cmds.objExists(names["tweak"]),
      cmds.objExists(names["stretch"]))
