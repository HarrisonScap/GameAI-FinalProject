extends Node2D

@onready var label = $"Player Information"
@onready var attack_label = $"Attack Description"
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


# Give attack1 description
func _on_attack_mouse_entered():
	var attack1 = Globals.weapons[Globals.playerWeapon].keys()[0]
	var attack_description = Globals.weapons[Globals.playerWeapon][attack1]["description"]
	attack_label.text = attack1 + " : " + attack_description

func _on_attack_2_mouse_entered():
	var attack2 = Globals.weapons[Globals.playerWeapon].keys()[1]
	var attack_description = Globals.weapons[Globals.playerWeapon][attack2]["description"]
	attack_label.text = attack2 + " : " + attack_description

func _on_attack_3_mouse_entered():
	var attack3 = Globals.weapons[Globals.playerWeapon].keys()[2]
	var attack_description = Globals.weapons[Globals.playerWeapon][attack3]["description"]
	attack_label.text = attack3 + " : " + attack_description

func _on_block_mouse_entered():
	attack_label.text = "Block : Reduces 10 damage from the next incoming attack.\nBlocks stun and bleed effects."

func _on_pass_mouse_entered():
	attack_label.text = "Pass: Doesn't attack or block but gains 10 stamina"

func _on_potion_mouse_entered():
	attack_label.text = "Potion : Use a potion, gain "  + str(Globals.potionHeal) + " Health"

# Hiding the Description Text

func _on_attack_mouse_exited():
	attack_label.text = ""

func _on_attack_2_mouse_exited():
	attack_label.text = ""

func _on_attack_3_mouse_exited():
	attack_label.text = ""

func _on_block_mouse_exited():
	attack_label.text = ""

func _on_pass_mouse_exited():
	attack_label.text = ""

func _on_potion_mouse_exited():
	attack_label.text = ""
