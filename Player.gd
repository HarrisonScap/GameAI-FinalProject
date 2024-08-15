extends Node2D

@onready var label = $"Player Information"

# Player Variables #
var health = 50
var is_blocking = false

# Continously updates the information per frame
func _process(delta):
	label.text = "Player" + "\n" + "Health: " + str(health)
