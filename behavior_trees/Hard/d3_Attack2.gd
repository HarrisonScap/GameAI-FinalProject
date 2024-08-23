class_name d3_Attack2 extends ActionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	if (Globals.weapons[Globals.enemyWeapon].keys()[1] in Globals.block_moves) and Globals.playerStamina <= 15:
			return FAILURE
	else: 
			Globals.enemyMove = Globals.weapons[Globals.enemyWeapon].keys()[1]
			return SUCCESS
