class_name d3_enoughStamina extends ConditionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
    for move in Globals.weapons[Globals.enemyWeapon].keys():
        if (Globals.weapons[Globals.enemyWeapon][move]["Stamina"] <= Globals.enemyStamina) and (Globals.weapons[Globals.enemyWeapon][move]["damage"] > 0):
            return SUCCESS
    return FAILURE