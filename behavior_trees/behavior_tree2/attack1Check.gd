class_name attack1Check extends ConditionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	var attack = Globals.weapons[Globals.enemyWeapon].keys()[0]
	var stamina_cost = Globals.weapons[Globals.enemyWeapon][attack]["Stamina"]
	
	var AI_attack_damage = Globals.weapons[Globals.enemyWeapon][attack]["damage"]


	if Globals.enemyStamina > stamina_cost && Globals.playerHealth <= AI_attack_damage:
		return SUCCESS
	else:
		return FAILURE


