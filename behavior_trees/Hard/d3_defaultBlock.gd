class_name d3_defaultBlock extends ActionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	if Globals.enemyStamina >= 25:
		Globals.enemyMove = "Block"
		return SUCCESS
	else:
		return FAILURE
