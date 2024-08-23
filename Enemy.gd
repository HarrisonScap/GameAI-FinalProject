extends Node2D

# Enemy information label
@onready var label = $"Enemy Information"
@onready var attack_label = $"Enemy Attack Info"

@onready var player = $"../Player"

# Different Gladiators 
@onready var enemy_sword = $"../../sword_gladiator_finished"
@onready var enemy_spear = $"../../spear_gladiator_finished"
@onready var enemy_mace = $"../../mace_gladiator_finished"

# Enemy "Buttons
@onready var attack1 = $"Attack1"
@onready var attack2 = $"Attack2"
@onready var attack3 = $"Attack3"

# Behavior tree difficulties
@onready var easy_tree = $EasyTree
@onready var medium_tree = $MediumTree
@onready var hard_tree = $HardTree

# Name of enemy
var enemy_name

# Continously updates the information per frame
func _process(delta):
	label.text = enemy_name + "\n" + "Health: " + str(Globals.enemyHealth) + "\nStamina: " + str(Globals.enemyStamina) + "\nDifficulty: "
	if easy_tree.enabled:
		label.text += "Easy" 
	elif medium_tree.enabled:
		label.text += "Medium"
	elif hard_tree.enabled:
		label.text += "Hard"
	
# Generates enemy name randomly
func generate_name():
	var names = [
		"Marcus",
		"Lucius",
		"Gaius",
		"Julius",
		"Publius",
		"Tiberius",
		"Aulus",
		"Decimus",
		"Quintus",
		"Setus",
		"Julia",
		"Claudia",
		"Livia",
		"Octavia",
		"Cornelia",
		"Aemilia",
		"Valeria",
		"Flavia",
		"Antonia",
		"Aurelia"]

	var titles = [
		"the Barbarian",
		"the Conqueror",
		"the Wise",
		"the Great",
		"the Mighty",
		"the Fierce",
		"the Merciful",
		"the Just",
		"the Bold",
		"the Brave",
		"the Swift",
		"the Unstoppable",
		"the Silent",
		"the Jolly",
		"the Hungry",
		"the Fearless",
		"the Sassy",
		"the Sleepy",
		"the Unwashed",
		"the Magnificent"
	]
	return names.pick_random() + " " + titles.pick_random()

# Chooses enemy move (currently just random)
func choose_move():
	var moves = ["Block", "Pass"]
	for key in Globals.weapons[Globals.enemyWeapon].keys():
		moves.append(key)
	return moves.pick_random()

func play_enemy_anim(enemy_move):
	if Globals.enemyWeapon == "Sword":
		enemy_sword.play(enemy_move)
	elif Globals.enemyWeapon == "Spear and Shield":
		enemy_spear.play(enemy_move)
	else:
		enemy_mace.play(enemy_move) 

# Spawns an enemy with increased health based on fights won by player
func spawn_enemy(fights_won):
	choose_difficulty(fights_won)
	Globals.enemyHealth = 100 + (5 * fights_won)
	Globals.enemyStamina = 100
	enemy_name = generate_name()
	label.text = enemy_name + "\n" + "Health: " + str(Globals.enemyHealth)
	
	
	Globals.enemyWeapon = ["Sword", "Spear and Shield", "Mace"].pick_random()
	await get_tree().create_timer(1).timeout
	play_enemy_anim("idle")
	
	# Set their buttons up in the UI
	var attack_moves = Globals.weapons[Globals.enemyWeapon].keys() # 3 moves
	attack1.text = attack_moves[0] + "\nStamina Cost: " + str(Globals.weapons[Globals.enemyWeapon][attack_moves[0]]["Stamina"])
	attack2.text = attack_moves[1] + "\nStamina Cost: " + str(Globals.weapons[Globals.enemyWeapon][attack_moves[1]]["Stamina"])
	attack3.text = attack_moves[2] + "\nStamina Cost: " + str(Globals.weapons[Globals.enemyWeapon][attack_moves[2]]["Stamina"])
	
	
# On game load, generates enemy name and forms the label
func _ready():
	Globals.enemyStun = false
	Globals.enemyBleed = false
	Globals.enemyBleedTurns = 0
	Globals.enemyPotions = 1
	easy_tree.enabled = false
	medium_tree.enabled = false
	hard_tree.enabled = false
	spawn_enemy(player.fights_won)

# chooses the difficulty of the new enemy based on the number of fights won
func choose_difficulty(fights_won):
	
	# These calculations are not working
	##var easy = max(0.5 - fights_won * 0.05, 0.1)
	##var medium = min(0.3 + fights_won * 0.05, 0.4)
	##var hard = min(0.2 + fights_won * 0.05, 0.5)
	#
	#var random_difficulty = randf_range(0, easy + medium + hard)
	
	#var random_difficulty = randf_range(0, 100)
	#
	#if random_difficulty < 70:
		#print("Tree: Easy")
		#easy_tree.enabled = true
	#elif random_difficulty < 90:
		#print("Tree: Medium")
		#medium_tree.enabled = true
	#else:
		#print("Tree: Hard")
		#hard_tree.enabled = true
	hard_tree.enabled = true
		

func _on_attack_1_mouse_entered():
	var attack1 = Globals.weapons[Globals.enemyWeapon].keys()[0]
	var attack_description = Globals.weapons[Globals.enemyWeapon][attack1]["description"]
	attack_label.text = attack1 + " : " + attack_description

func _on_attack_2_mouse_entered():
	var attack2 = Globals.weapons[Globals.enemyWeapon].keys()[1]
	var attack_description = Globals.weapons[Globals.enemyWeapon][attack2]["description"]
	attack_label.text = attack2 + " : " + attack_description

func _on_attack_3_mouse_entered():
	var attack3 = Globals.weapons[Globals.enemyWeapon].keys()[2]
	var attack_description = Globals.weapons[Globals.enemyWeapon][attack3]["description"]
	attack_label.text = attack3 + " : " + attack_description


# Clear weapon description

func _on_attack_1_mouse_exited():
	attack_label.text = ""


func _on_attack_2_mouse_exited():
	attack_label.text = ""

func _on_attack_3_mouse_exited():
	attack_label.text = ""
