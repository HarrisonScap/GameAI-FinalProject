class_name d2_checkBlock extends ConditionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	if Globals.enemyStamina > 25:
		return SUCCESS
	else:
		return FAILURE
