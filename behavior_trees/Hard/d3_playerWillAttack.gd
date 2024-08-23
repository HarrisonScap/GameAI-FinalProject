class_name d3_playerWillAttack extends ConditionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	if Globals.playerHealth == 100 and Globals.playerStamina >= 90:
		return SUCCESS
	else:
		return FAILURE
