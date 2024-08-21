class_name d3_playerStaminaZero extends ConditionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
    if Globals.playerStamina == 0:
        return SUCCESS
    else:
        return FAILURE
