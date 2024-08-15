extends Node3D

# Player and enemy #
@onready var enemy = $Control/Enemy
@onready var player = $Control/Player

# Controls #
@onready var attack_button = $Control/Player/Attack
@onready var block_button = $Control/Player/Block
@onready var continue_button = $Control/Continue

# Label #
@onready var label = $Control/resolve

# Game variables #
var round = 1




func play(player_move):
	var enemy_move = enemy.choose_move()
	print("Enemy chooses " + str(enemy_move))
	resolve(player_move, enemy_move)
	round += 1

func resolve(player_move, enemy_move):
	# Check if player and enemy are blocking
	if enemy_move == "Block":
		enemy.is_blocking = true
	if player_move == "Block":
		player.is_blocking = true
	
	# Then resolve attack
	if player_move == "Attack" and !enemy.is_blocking:
		enemy.health -= 10
	if enemy_move == "Attack" and !player.is_blocking:
		player.health -= 10
	
	enemy.is_blocking = false
	player.is_blocking = false
	label.text = "The player chooses " + str(player_move) + "\n" + str(enemy.name) + " chooses " + str(enemy_move)
	continue_button.visible = true

func toggle_button_visibility():
	print(attack_button.visible)
	attack_button.visible = !attack_button.visible
	block_button.visible = !block_button.visible
	

func _on_block_pressed():
	print("Player chooses Block")
	play("Block")
	toggle_button_visibility()
	
func _on_attack_pressed():
	print("Player chooses attack")
	play("Attack")
	toggle_button_visibility()

# To continue the match after the conflict was resolved #
func _on_continue_pressed():
	label.text = ""
	continue_button.visible = false
	toggle_button_visibility()
