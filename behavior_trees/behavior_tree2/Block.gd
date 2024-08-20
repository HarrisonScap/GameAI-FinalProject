class_name Block extends ActionLeaf


func tick(actor: Node, _blackboard: Blackboard) -> int:
	Globals.enemyMove = "Block"
	return SUCCESS
