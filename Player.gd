extends Node2D

@onready var label = $"Player Information"

# Player Variables #
var health = 100
var stamina = 100


var fights_won = 0
var potions = 3 # starts with 3 potions, change as needed for balance

# Conditions #

var is_blocking = false
var is_stun = false
var is_bleeding = false
var bleeding_remaining_turns = 0

# Continously updates the information per frame
func _process(delta):
	label.text = "Player" + "\n" + "Health: " + str(health) + "\nStamina: " + str(stamina) 
	

