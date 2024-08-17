extends Node2D

@onready var label = $"Player Information"

# Player Variables #
var health = 50
var is_blocking = false
var stamina = 100
var fights_won = 0
var potions = 3 # starts with 3 potions, change as needed for balance

# Continously updates the information per frame
func _process(delta):
	label.text = "Player" + "\n" + "Health: " + str(health)
	

