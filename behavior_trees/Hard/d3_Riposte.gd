class_name d3_Riposte extends ActionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	Globals.enemyMove = "Riposte"
	return SUCCESS
