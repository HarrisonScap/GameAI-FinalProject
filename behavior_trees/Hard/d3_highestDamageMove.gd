class_name d3_highestDamageMove extends ActionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
    var highest_damage = 0
    for move in Globals.weapons[Globals.enemyWeapon].keys():
        if (Globals.weapons[Globals.enemyWeapon][move]["damage"] > highest_damage) and (Globals.weapons[Globals.enemyWeapon][move]["Stamina"] <= Globals.enemyStamina):
            highest_damage = Globals.weapons[Globals.enemyWeapon][move]["damage"]
            Globals.enemyMove = move

    return SUCCESS