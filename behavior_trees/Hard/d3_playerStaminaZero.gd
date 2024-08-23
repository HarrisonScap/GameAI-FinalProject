class_name d3_playerStaminaZero extends ConditionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	if Globals.playerStamina <= 10 or Globals.playerStun:
		return SUCCESS
	else:
		return FAILURE
