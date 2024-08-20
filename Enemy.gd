extends Node2D

# Enemy information label
@onready var label = $"Enemy Information"

@onready var player = $"../Player"

# Different Gladiators 
@onready var enemy_sword = $"../../sword_gladiator_finished"


# Name of enemy
var enemy_name

# Continously updates the information per frame
func _process(delta):
	label.text = enemy_name + "\n" + "Health: " + str(Globals.enemyHealth) + "\nStamina: " + str(Globals.enemyStamina) 

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

# Spawns an enemy with increased health based on fights won by player
func spawn_enemy(fights_won):
	Globals.enemyHealth = 100 + (5 * fights_won)
	Globals.enemyStamina = 100
	enemy_name = generate_name()
	label.text = enemy_name + "\n" + "Health: " + str(Globals.enemyHealth)
	Globals.enemyWeapon = ["Sword", "Spear and Shield", "Mace"].pick_random()
	
	
# On game load, generates enemy name and forms the label
func _ready():
	spawn_enemy(player.fights_won)
	Globals.enemyStun = false
	Globals.enemyBleed = false
	Globals.enemyBleedTurns = 0
	Globals.enemyPotions = 1


