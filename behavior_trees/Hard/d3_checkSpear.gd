class_name d3_checkSpear extends ConditionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	if Globals.enemyWeapon == "Spear and Shield" and Globals.enemyStamina >= 15:
		return SUCCESS
	else:
		return FAILURE
