class_name d3_checkKillMovePotion1 extends ConditionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
	var attack = Globals.weapons[Globals.enemyWeapon].keys()[0]
	var stamina_cost = Globals.weapons[Globals.enemyWeapon][attack]["Stamina"]
	var player_hp = Globals.playerHealth
	if Globals.playerPotions > 0:
		player_hp += Globals.potionHeal
	
	var move_damage = Globals.weapons[Globals.enemyWeapon][attack]["damage"]

	if (Globals.enemyStamina >= stamina_cost) and (move_damage >= player_hp):
		return SUCCESS
	else:
		return FAILURE
