class_name healthCheck extends ConditionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
    if Globals.enemyHealth < 30:
        return SUCCESS
    else:
        return FAILURE
