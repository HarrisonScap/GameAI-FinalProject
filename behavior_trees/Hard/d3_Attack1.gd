class_name d3_Attack1 extends ActionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	if (Globals.weapons[Globals.enemyWeapon].keys()[0] in Globals.block_moves) and Globals.playerStamina <= 15:
		return FAILURE
	else: 
		Globals.enemyMove = Globals.weapons[Globals.enemyWeapon].keys()[0]
		return SUCCESS
