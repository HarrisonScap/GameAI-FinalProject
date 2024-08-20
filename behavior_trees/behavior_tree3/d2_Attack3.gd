class_name d2_Attack3 extends ActionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	Globals.enemyMove = Globals.weapons[Globals.enemyWeapon].keys()[2]
	print(Globals.enemyMove)
	return SUCCESS
