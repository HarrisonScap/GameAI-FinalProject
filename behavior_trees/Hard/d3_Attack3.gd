class_name d3_Attack3 extends ActionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	Globals.enemyMove = Globals.weapons[Globals.enemyWeapon].keys()[2]
	return SUCCESS
