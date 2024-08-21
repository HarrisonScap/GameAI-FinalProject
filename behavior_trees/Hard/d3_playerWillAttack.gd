class_name d3_playerWillAttack extends ConditionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	if Globals.playerHealth == 100:
		return SUCCESS
	else:
		return FAILURE
