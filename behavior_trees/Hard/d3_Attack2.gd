class_name d3_Attack2 extends ActionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	Globals.enemyMove = Globals.weapons[Globals.enemyWeapon].keys()[1]
	return SUCCESS
