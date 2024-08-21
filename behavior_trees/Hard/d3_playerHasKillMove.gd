class_name d3_playerHasKillMove extends ConditionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
    # check what highest damage move player can use is
    # compare damage of highest move against my hp

    var highest_damage = 0
    for p_move in Globals.weapons[Globals.playerWeapon].keys():
        if (Globals.weapons[Globals.playerWeapon][p_move]["damage"] > highest_damage) and (Globals.weapons[Globals.playerWeapon][p_move]["Stamina"] >= Globals.playerStamina):
            highest_damage = Globals.weapons[Globals.playerWeapon][p_move]["damage"]
    
    if highest_damage > Globals.enemyHealth:
        return SUCCESS
    else:
        return FAILURE