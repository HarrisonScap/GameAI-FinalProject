class_name attack3Check extends ConditionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
    var attack = Globals.weapons[Globals.enemyWeapon].keys()[2]
    var stamina_cost = Globals.weapons[Globals.enemyWeapon][attack]["Stamina"]
    if Globals.enemyStamina >= stamina_cost:
        return SUCCESS
    else:
        return FAILURE
