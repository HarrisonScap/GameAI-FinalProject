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

func _process(delta):
	# if enemy or player dies...
	if enemy.health < 1:
		#update fights won, spawn a new enemy with increased health
		player.fights_won += 1
		enemy.spawn_enemy(player.fights_won)
		if player.fights_won % 3 == 0: # give the player a potion every 3 wins
			player.potions += 1
	elif player.health < 1:
		get_tree().change_scene_to_file("res://mainmenu.tscn")  # add scene for the main menu (.tscn)




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

	########################
	# Non-variable actions #
	########################
	# perform potions and stamina costs
	if player_move == "Potion":
		player.health += 10
		player.potions -= 1
	elif player_move == "Pass":
		player.stamina += 10
	elif player_move == "Block":
		player.stamina -= 25
	else:
		# Index into  weapon dictionary and remove stamina from player
		player.stamina -= Globals.weapons[Globals.playerWeapon][player_move]["Stamina"]
	
	#same for enemy
	if enemy_move == "Potion": #take this out if enemies do not have potions. maybe bosses have them?
		enemy.health += 10
		enemy.potions -= 1
	elif enemy_move == "Pass":
		enemy.stamina += 10
	elif enemy_move == "Block":
		enemy.stamina -= 25
	else:
		# Index into  weapon dictionary and remove stamina from enemy
		enemy.stamina -= Globals.weapons[Globals.enemyWeapon][enemy_move]["Stamina"]


	###############################
	# Check all conditional Moves #
	###############################

	#if player move = swing & enemymove = reposte retrun true
	#if playermove = swing & enemymove = block return true
	#if playermove = 
	# if conditions_met():
	

	# check if one person is blocking
	if (player_move in Globals.damage_moves) && (enemy_move in Globals.block_moves):
	
		#some moves are unblockable
		if player_move in Globals.unblockable_moves:
			enemy.health -= (Globals.weapons[Globals.playerWeapon][player_move]["damage"])
			#spin attack stuns the attacker
			if player_move == "Spin Attack":
				player.is_stun = true
	
		#riposte is a block that deals damage to the attacker
		elif enemy_move == "Riposte":
			player.health -= Globals.weapons["Sword"]["Riposte"]["damage"]
	
		#block reduces damage by 10, so block only "works" if the move does more than 10 damage
		elif enemy_move == "Block" and Globals.weapons[Globals.playerWeapon][player_move]["damage"] >= 10:
			enemy.health -= (Globals.weapons[Globals.playerWeapon][player_move]["damage"] - 10)
	
	
	elif (player_move in Globals.block_moves) && (enemy_move in Globals.damage_moves):
		if enemy_move in Globals.unblockable_moves:
			player.health -= Globals.weapons[Globals.enemyWeapon][enemy_move]["damage"]
			if enemy_move == "Spin Attack":
				enemy.is_stun = true
	
		elif player_move == "Riposte":
			enemy.health -= Globals.weapons["Sword"]["Riposte"]["damage"]
	
		elif player_move == "Block" and Globals.weapons[Globals.enemyWeapon][enemy_move]["damage"] >= 10:
			player.health -= (Globals.weapons[Globals.enemyWeapon][enemy_move]["damage"] - 10)
	
	
	#check if both people are blocking (nothing happens)
	elif (player_move in Globals.block_moves) && (enemy_move in Globals.block_moves):
		pass
	
	#otherwise both people are dealing damage (or passing or potion)
	else: # damage + damage // damage + stun // 
		#check for stun moves
		if (player_move in Globals.stun_moves): # player stuns enemy #
			enemy.is_stun = true
		if (enemy_move in Globals.stun_moves): # enemy stuns player #
			player.is_stun = true
		
		#check for bleed moves
		if enemy_move in Globals.bleed_moves:
			player.is_bleeding = true  
			player.bleeding_remaining_turns = 2
			player.bleed_damage = 5  
		
		
		if player_move in Globals.bleed_moves:
			enemy.is_bleeding = true 
			enemy.bleeding_remaining_turns = 2
			enemy.bleed_damage = 5

		if player_move in Globals.damage_moves:
			enemy.health -= Globals.weapons[Globals.playerWeapon][player_move]["damage"]
		if enemy_move in Globals.damage_moves:
			player.health -= Globals.weapons[Globals.enemyWeapon][enemy_move]["damage"]
		

	if player.is_bleeding: 
		player.health -= player.bleed_damage
		player.bleeding_remaining_turns -=1
		if player.bleeding_remaining_turns <= 0:
			player.is_bleeding = false
	
	if enemy.is_bleeding: 
		enemy.health -= player.bleed_damage
		enemy.bleeding_remaining_turns -=1
		if enemy.bleeding_remaining_turns <= 0:
			enemy.is_bleeding = false

	
	# Put together the resolution text
	label.text = "The player chooses " + str(player_move) + "\n" + str(enemy.name) + " chooses " + str(enemy_move)
	continue_button.visible = true

# Toggles visibility of the attack and block buttons
func toggle_button_visibility():
	attack_button.visible = !attack_button.visible
	block_button.visible = !block_button.visible


# Button "gray-out" cases

# If they're stunned, forced to pass
# If not enough stamina, gray out those buttons


# Signal from block button
func _on_block_pressed():
	print("Player chooses Block")
	play("Block")
	toggle_button_visibility()

# Signal from attack button
func _on_attack_pressed():

	toggle_button_visibility()

func _on_attack_2_pressed():
	pass # Replace with function body.
	

func _on_attack_3_pressed():
	pass # Replace with function body.


# Signal from continue button
func _on_continue_pressed():
	label.text = ""
	continue_button.visible = false
	toggle_button_visibility()


func _on_pass_pressed():
	print("Player chooses Pass")
	play("Pass")
	toggle_button_visibility()


func _on_potion_pressed():
	print("Player chose Potion")
	play("Potion")
	toggle_button_visibility()
	
	


