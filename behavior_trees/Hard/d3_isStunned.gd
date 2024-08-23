class_name d3_isStunned extends ConditionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	if Globals.enemyStun:
		return SUCCESS
	else:
		return FAILURE
