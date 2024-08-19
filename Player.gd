extends Node2D

@onready var label = $"Player Information"
var fights_won = 0

# Continously updates the information per frame
func _process(delta):
	label.text = "Player" + "\n" + "Health: " + str(Globals.playerHealth) + "\nStamina: " + str(Globals.playerStamina) 

func _ready():
	Globals.playerHealth = 100
	Globals.playerStamina = 100
	Globals.playerStun = false
	Globals.playerBleed = false
	Globals.playerBleedTurns = 0
	Globals.playerPotions = 3
