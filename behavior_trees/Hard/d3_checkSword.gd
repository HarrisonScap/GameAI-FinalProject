class_name d3_checkSword extends ConditionLeaf

func tick(actor: Node, _blackboard: Blackboard) -> int:
    if Globals.enemyWeapon == "Sword" and Globals.enemyStamina >= 30:
        print("HERE!")
        return SUCCESS
    else:
        return FAILURE