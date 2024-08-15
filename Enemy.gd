extends Node2D

# Enemy information label
@onready var label = $"Enemy Information"

# Name of enemy
var enemy_name
var health = 50
var is_blocking = false

# Continously updates the information per frame
func _process(delta):
	label.text = enemy_name + "\n" + "Health: " + str(health)

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
	var moves = ["Attack", "Block"]
	return moves.pick_random()

# On game load, generates enemy name and forms the label
func _ready():
	enemy_name = generate_name()
	label.text = enemy_name + "\n" + "Health: " + str(health)


