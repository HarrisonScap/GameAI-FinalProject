extends ConditionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	if !Globals.enemyStun: #if not stunned
		return SUCCESS
	return FAILURE
