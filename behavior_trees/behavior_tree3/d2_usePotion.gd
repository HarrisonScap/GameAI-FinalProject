class_name d2_usePotion extends ActionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	Globals.enemyMove = "Potion"
	Globals.enemyPotions -= 1
	return SUCCESS
