extends ConditionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
    if Globals.enemyStun:
        return SUCCESS
    return FAILURE