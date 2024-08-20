class_name d2_Block extends ActionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	Globals.enemyMove = "Block"
	print(Globals.enemyMove)
	return SUCCESS
