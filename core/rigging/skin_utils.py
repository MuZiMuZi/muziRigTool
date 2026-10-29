class Skin(object):
    "对蒙皮进行操作的类"
    def __init__(self, skin_node = None):
        self.skin_node = skin_node


    def get_skin_jnt(self):
        "获取蒙皮的所有蒙皮骨骼"
        self.skin_jnt_list = cmds.skinCluster("skinCluster1",query=True,influence=True)
        return self.skin_jnt_list
    