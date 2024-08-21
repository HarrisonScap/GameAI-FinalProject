class_name d3_checkHealthPotion extends ConditionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	if Globals.enemyHealth < 30 and Globals.enemyPotions > 0:
		return SUCCESS
	else:
		return FAILURE
