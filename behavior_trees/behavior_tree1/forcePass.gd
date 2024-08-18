class_name forcePass extends ActionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
    Globals.enemyMove = "Pass"
    return SUCCESS