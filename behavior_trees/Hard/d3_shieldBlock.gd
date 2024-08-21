class_name d3_shieldBlock extends ActionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
    Globals.enemyMove = "Shield Block"
    return SUCCESS