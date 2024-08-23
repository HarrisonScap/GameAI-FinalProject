class_name usePotion extends ActionLeaf

#var target: NodePath

# func _init(target: NodePath):
#     self.target = target

func tick(actor: Node, _blackboard: Blackboard) -> int:
	# var target_node = blackboard.get_node(self.target)
	# if target_node == null:
	#     return FAILURE
	
	

	Globals.enemyMove = "Potion"
	Globals.enemyPotions -= 1
	return SUCCESS

	#return RUNNING
