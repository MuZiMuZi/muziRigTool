# coding=utf-8
"""Measure controller shape vs pivot after build."""
import os
import sys

SCRIPTS_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
if SCRIPTS_DIR not in sys.path:
    sys.path.insert(0, SCRIPTS_DIR)

import maya.standalone

maya.standalone.initialize(name="python")

from maya import cmds  # noqa: E402

from muziRigTool.systems.rig.guide import Guide  # noqa: E402
from muziRigTool.systems.rig.module.face.jaw import Jaw  # noqa: E402

cmds.file(new=True, force=True)
g = Guide("face")
g.import_template()

jaw = Jaw(side="md", guides=[g.get_face_move(), g.get_face_jaw()])
jaw.build_rig()
jaw.connect_rig()

for name in ('ctrl_md_jaw_main_001', 'zero_md_jaw_main_001',
             'ctrl_md_face_move_001'):
    pos = cmds.xform(name, q=True, ws=True, t=True)
    try:
        bbox = cmds.exactWorldBoundingBox(name)
    except Exception as error:
        bbox = 'bbox error: {}'.format(error)
    print(name)
    print('   pos:', [round(v, 1) for v in pos])
    print('   bbox:', bbox if isinstance(bbox, str)
          else [round(v, 1) for v in bbox])
    print('   shape bbox:', cmds.exactWorldBoundingBox(
        *cmds.listRelatives(name, shapes=True) or [name]))

print()
print('pivot locator:', [round(v, 1) for v in
      cmds.xform('loc_md_jaw_start_bind_001', q=True, ws=True, t=True)])
print('jaw joint:', [round(v, 1) for v in
      cmds.xform('jnt_md_jaw_bind_001', q=True, ws=True, t=True)])
