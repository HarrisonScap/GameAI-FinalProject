class_name d2_Attack1 extends ActionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	Globals.enemyMove = Globals.weapons[Globals.enemyWeapon].keys()[0]
	print(Globals.enemyMove)
	return SUCCESS
