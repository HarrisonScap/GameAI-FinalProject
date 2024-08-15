extends Node2D

@onready var label = $"Player Information"

var health = 50
var is_blocking = false

func _process(delta):
	label.text = "Player" + "\n" + "Health: " + str(health)
