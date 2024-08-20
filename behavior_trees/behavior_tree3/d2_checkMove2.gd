class_name d2_checkMove2 extends ConditionLeaf


func tick(actor: Node, _blackboard: Blackboard) -> int:
	var attack = Globals.weapons[Globals.enemyWeapon].keys()[1]
	var stamina_cost = Globals.weapons[Globals.enemyWeapon][attack]["Stamina"]
	
	var AI_attack_damage = Globals.weapons[Globals.enemyWeapon][attack]["damage"]


	if Globals.enemyStamina >= stamina_cost:
		return SUCCESS
	else:
		return FAILURE
