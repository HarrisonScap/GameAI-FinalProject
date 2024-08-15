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

# Called by the whatever button the player clicks, gets the enemy move and then calls
# resolve() to play out the game
func play(player_move):
	var enemy_move = enemy.choose_move()
	print("Enemy chooses " + str(enemy_move))
	resolve(player_move, enemy_move)
	round += 1

# Handles all the game logic regarding what moves do what -- we may wana think of
# a better way to do this...
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
	
	# Reset the blocking state to false
	enemy.is_blocking = false
	player.is_blocking = false
	
	# Put together the resolution text
	label.text = "The player chooses " + str(player_move) + "\n" + str(enemy.name) + " chooses " + str(enemy_move)
	continue_button.visible = true

# Toggles visibility of the attack and block buttons
func toggle_button_visibility():
	attack_button.visible = !attack_button.visible
	block_button.visible = !block_button.visible
	
# Signal from block button
func _on_block_pressed():
	print("Player chooses Block")
	play("Block")
	toggle_button_visibility()

# Signal from attack button
func _on_attack_pressed():
	print("Player chooses attack")
	play("Attack")
	toggle_button_visibility()

# Signal from continue button
func _on_continue_pressed():
	label.text = ""
	continue_button.visible = false
	toggle_button_visibility()
