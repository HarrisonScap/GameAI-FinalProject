class_name Attack1 extends ActionLeaf


func tick(actor: Node, _blackboard: Blackboard) -> int:
    Globals.enemyMove = Globals.weapons[Globals.enemyWeapon].keys()[0]
    return SUCCESS