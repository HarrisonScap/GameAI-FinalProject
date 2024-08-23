extends Node3D

# Player and enemy #
@onready var enemy = $Control/Enemy
@onready var player = $Control/Player

############
# Controls #
############

# Sounds
@onready var attack_sound_player = $AudioStreamPlayer  # Reference the AudioStreamPlayer node

# Attacks
@onready var attack1_button = $Control/Player/Attack
@onready var attack2_button = $Control/Player/Attack2
@onready var attack3_button = $Control/Player/Attack3

# Other
@onready var block_button = $Control/Player/Block
@onready var potion_button = $Control/Player/Potion
@onready var pass_button = $Control/Player/Pass
@onready var continue_button = $Control/Continue

# Enemy Gladiators 
@onready var enemy_sword = $sword_gladiator_finished
@onready var enemy_spear = $spear_gladiator_finished
@onready var enemy_mace = $mace_gladiator_finished

# Player Gladiators

@onready var player_sword = $sword_player
@onready var player_spear = $player_spear
@onready var player_mace = $player_mace

# Cameras
@onready var normalCamera = $Camera3D
@onready var actionCam1 = $actionCamera1
@onready var actionCam2 = $actionCamera2
@onready var actionCam3 = $actionCamera3

# Entire UI
@onready var gameUI = $Control
@onready var victoryUI = $victoryUI

# Label #
@onready var label = $Control/resolve

# Game variables #
var game_round = 1
var attack_moves


func _ready():
	attack_moves = Globals.weapons[Globals.playerWeapon].keys() # 3 moves
	attack1_button.text = attack_moves[0] + "\nStamina Cost: " + str(Globals.weapons[Globals.playerWeapon][attack_moves[0]]["Stamina"])
	attack2_button.text = attack_moves[1] + "\nStamina Cost: " + str(Globals.weapons[Globals.playerWeapon][attack_moves[1]]["Stamina"])
	attack3_button.text = attack_moves[2] + "\nStamina Cost: " + str(Globals.weapons[Globals.playerWeapon][attack_moves[2]]["Stamina"])


func _process(delta):
	# if enemy or player dies...
	if Globals.enemyHealth < 1 and Globals.enemyHealth != -100:
		
		# Upon Death, reset player health and stamina
		
		Globals.playerHealth = 100
		Globals.playerStamina = 100
		Globals.enemyHealth = -100
		player.fights_won += 1
		
		
		# Play death animation and swap UI
		play_enemy_anim("death")
		gameUI.visible = false
		victoryUI.visible = true
		
		# Edit victory text
		victoryUI.victory_text(enemy.enemy_name)
		
		
		await get_tree().create_timer(5).timeout
		victoryUI.visible = false
		gameUI.visible = true
		
		# Spawn new enemy
		enemy.spawn_enemy(player.fights_won)
		
		
		if player.fights_won % 3 == 0: # give the player a potion every 3 wins
			Globals.playerPotions += 1
	
	
	elif Globals.playerHealth < 1:
		gameUI.visible = false
		victoryUI.visible = true
		# Edit defeat text
		victoryUI.defeat_text(enemy.enemy_name)
		play_player_anim("death")
		
		await get_tree().create_timer(2).timeout
		
		get_tree().change_scene_to_file("res://mainmenu.tscn")  # add scene for the main menu (.tscn)
		
	# Shows the enemy model that you're currently facing and hides the others
	if Globals.enemyWeapon == "Sword":
		enemy_sword.visible = true
		enemy_spear.visible = false
		enemy_mace.visible = false
	elif Globals.enemyWeapon == "Spear and Shield":
		enemy_sword.visible = false
		enemy_spear.visible = true
		enemy_mace.visible = false
	else:
		enemy_sword.visible = false
		enemy_spear.visible = false
		enemy_mace.visible = true
	
	# ... and for player
	
		# Shows the enemy model that you're currently facing and hides the others
	if Globals.playerWeapon == "Sword":
		player_sword.visible = true
		player_spear.visible = false
		player_mace.visible = false
	elif Globals.playerWeapon == "Spear and Shield":
		player_sword.visible = false
		player_spear.visible = true
		player_mace.visible = false
	else:
		player_sword.visible = false
		player_spear.visible = false
		player_mace.visible = true
	
	# Block
	if Globals.playerStamina < 25 or Globals.playerStun:
		block_button.disabled = true
	else:
		block_button.disabled = false
		
	# Attack 1
	if Globals.playerStun or Globals.playerStamina < Globals.weapons[Globals.playerWeapon][attack_moves[0]]["Stamina"]:
		attack1_button.disabled = true
	else:
		attack1_button.disabled = false

	# Attack 2
	if Globals.playerStun or Globals.playerStamina < Globals.weapons[Globals.playerWeapon][attack_moves[1]]["Stamina"]:
		attack2_button.disabled = true
	else:
		attack2_button.disabled = false

	# Attack 3
	if Globals.playerStun or Globals.playerStamina < Globals.weapons[Globals.playerWeapon][attack_moves[2]]["Stamina"]:
		attack3_button.disabled = true
	else:
		attack3_button.disabled = false


	potion_button.text = "Potions (" + str(Globals.playerPotions) + "/3)"
	# Potion
	if Globals.playerPotions == 0 or Globals.playerStun or Globals.playerHealth == 100:
		potion_button.disabled = true
	else:
		potion_button.disabled = false

	
# Play a specified animation for a specific enemy type
func play_enemy_anim(enemy_move):
	if Globals.enemyWeapon == "Sword":
		enemy_sword.play(enemy_move)
	elif Globals.enemyWeapon == "Spear and Shield":
		enemy_spear.play(enemy_move)
	else:
		enemy_mace.play(enemy_move) #not yet implemented
		
# Play a specified animation for a specific player type
func play_player_anim(player_move):
	if Globals.playerWeapon == "Sword":
		player_sword.play(player_move)
	elif Globals.playerWeapon == "Spear and Shield":
		player_spear.play(player_move)
	else:
		player_mace.play(player_move) #not yet implemented



# Called by the whatever button the player clicks, gets the enemy move and then calls
# resolve() to play out the game
func play(player_move):
	

	#var sound_path = Globals.weapons[Globals.playerWeapon][player_move]["sound"]
	#var sound_stream = load(sound_path)
	#
	#if sound_stream != null:
		#attack_sound_player.stream = sound_stream
		#attack_sound_player.play()
	

	# Handle enemy move
	var enemy_move = Globals.enemyMove
		# Percent chance to go to an action camera
	var cameraChance = randf_range(0,100)
	if cameraChance < 15:
		actionCam1.make_current()
	elif cameraChance < 30 and enemy_move != "Pass":
		actionCam2.make_current()
	elif cameraChance < 65 and player_move != "Pass":
		actionCam3.make_current()
	else:
		normalCamera.make_current()



	# Play both attack animations
	play_enemy_anim(enemy_move)
	print("Player chooses" + player_move)
	play_player_anim(player_move)
	
	print("Enemy chooses " + str(enemy_move))
	
	resolve(player_move, enemy_move) # Resolve conflict
	
	game_round += 1

# Handles all the game logic regarding what moves do what -- we may wana think of
# a better way to do this...
func resolve(player_move, enemy_move):

	########################
	# Non-variable actions #
	########################
	# perform potions and stamina costs
	if player_move == "Potion":
		Globals.playerHealth += Globals.potionHeal
		Globals.playerPotions -= 1
		
		# Stop Bleeding
		Globals.playerBleedTurns = 0
		Globals.playerBleed = false
		
		if Globals.playerHealth > 100:
			Globals.playerHealth = 100
	elif player_move == "Pass":
		Globals.playerStun = false
		Globals.playerStamina += 10
		if Globals.playerStamina > 100:
			Globals.playerStamina = 100
	elif player_move == "Block":
		Globals.playerStamina -= 25
	else:
		# Index into  weapon dictionary and remove stamina from player
		Globals.playerStamina -= Globals.weapons[Globals.playerWeapon][player_move]["Stamina"]
	
	# Check if bleeding
	if Globals.playerBleed: 
		Globals.playerHealth -= 10
		Globals.playerBleedTurns -= 1
		if Globals.playerBleedTurns <= 0:
			Globals.playerBleed = false
	
	if Globals.enemyBleed: 
		Globals.enemyHealth -= 5
		Globals.enemyBleedTurns -=1
		if Globals.enemyBleedTurns <= 0:
			Globals.enemyBleed = false

	#same for enemy
	if enemy_move == "Potion": #take this out if enemies do not have potions. maybe bosses have them?
		Globals.enemyHealth += Globals.potionHeal
		Globals.enemyPotions -= 1
		if Globals.enemyHealth > 100:
			Globals.enemyHealth = 100
	elif enemy_move == "Pass":
		Globals.enemyStun = false
		Globals.enemyStamina += 10
		if Globals.enemyStamina > 100:
			Globals.enemyStamina = 100
	elif enemy_move == "Block":
		Globals.enemyStamina -= 25
	else:
		# Index into  weapon dictionary and remove stamina from enemy
		Globals.enemyStamina -= Globals.weapons[Globals.enemyWeapon][enemy_move]["Stamina"]
	

	# check if one person is blocking
	if (player_move in Globals.damage_moves) && (enemy_move in Globals.block_moves):
	
		#some moves are unblockable
		if player_move in Globals.unblockable_moves:
			Globals.enemyHealth -= (Globals.weapons[Globals.playerWeapon][player_move]["damage"])
			#spin attack stuns the attacker
			if player_move == "Spin Attack":
				Globals.playerStun = true
	
		#riposte is a block that deals damage to the attacker
		elif enemy_move == "Riposte":
			Globals.playerHealth -= Globals.weapons["Sword"]["Riposte"]["damage"]
	
		#block reduces damage by 10, so block only "works" if the move does more than 10 damage
		elif enemy_move == "Block" and Globals.weapons[Globals.playerWeapon][player_move]["damage"] >= 10:
			Globals.enemyHealth -= (Globals.weapons[Globals.playerWeapon][player_move]["damage"] - 10)
	
	
	elif (player_move in Globals.block_moves) && (enemy_move in Globals.damage_moves):
		if enemy_move in Globals.unblockable_moves:
			Globals.playerHealth -= Globals.weapons[Globals.enemyWeapon][enemy_move]["damage"]
			if enemy_move == "Spin Attack":
				Globals.enemyStun = true
	
		elif player_move == "Riposte":
			Globals.enemyHealth -= Globals.weapons["Sword"]["Riposte"]["damage"]
	
		elif player_move == "Block" and Globals.weapons[Globals.enemyWeapon][enemy_move]["damage"] >= 10:
			Globals.playerHealth -= (Globals.weapons[Globals.enemyWeapon][enemy_move]["damage"] - 10)
	
	
	#check if both people are blocking (nothing happens)
	elif (player_move in Globals.block_moves) && (enemy_move in Globals.block_moves):
		pass
	
	#otherwise both people are dealing damage (or passing or potion)
	else: # damage + damage // damage + stun // 
		#check for stun moves
		if (player_move in Globals.stun_moves): # player stuns enemy #
			Globals.enemyStun = true
		if (enemy_move in Globals.stun_moves): # enemy stuns player #
			Globals.playerStun = true
		
		#check for bleed moves
		if enemy_move in Globals.bleed_moves:
			Globals.playerBleed = true  
			Globals.playerBleedTurns = 2  
		
		
		if player_move in Globals.bleed_moves:
			Globals.enemyBleed = true 
			Globals.enemyBleedTurns = 2

		if player_move in Globals.damage_moves:
			Globals.enemyHealth -= Globals.weapons[Globals.playerWeapon][player_move]["damage"]
		if enemy_move in Globals.damage_moves:
			Globals.playerHealth -= Globals.weapons[Globals.enemyWeapon][enemy_move]["damage"]		

	# Reset camera if not normal
	if get_viewport().get_camera_3d() != normalCamera:
		await get_tree().create_timer(3).timeout
		normalCamera.make_current()

	# Put together the resolution text
	if Globals.enemyHealth > 0:
		label.text = "The player chooses " + str(player_move) + "\n" + str(enemy.name) + " chooses " + str(enemy_move)
		continue_button.visible = true
	else:
		toggle_button_visibility() # idk why i need to do this tbh

	

# Toggles visibility of the attack and block buttons
func toggle_button_visibility():
	attack1_button.visible = !attack1_button.visible
	attack2_button.visible = !attack2_button.visible
	attack3_button.visible = !attack3_button.visible
	potion_button.visible = !potion_button.visible
	pass_button.visible = !pass_button.visible
	block_button.visible = !block_button.visible


# Button "gray-out" cases

# If they're stunned, forced to pass
# If not enough stamina, gray out those buttons


# Signal from block button
func _on_block_pressed():
	play("Block")
	toggle_button_visibility()

# Signal from attack button
func _on_attack_pressed():
	if Globals.playerStun or Globals.playerStamina < Globals.weapons[Globals.playerWeapon][attack_moves[0]]["Stamina"]:
		pass
	else:	
		play(attack_moves[0])
		toggle_button_visibility()

func _on_attack_2_pressed():
	if Globals.playerStun or Globals.playerStamina < Globals.weapons[Globals.playerWeapon][attack_moves[1]]["Stamina"]:
		pass
	else:	
		play(attack_moves[1])
		toggle_button_visibility()
		

func _on_attack_3_pressed():
	if Globals.playerStun or Globals.playerStamina < Globals.weapons[Globals.playerWeapon][attack_moves[2]]["Stamina"]:
		pass
	else:	
		play(attack_moves[2])
		toggle_button_visibility()

func _on_pass_pressed():
	print("Player chooses Pass")
	play("Pass")
	toggle_button_visibility()

func _on_potion_pressed():
	if Globals.playerPotions == 0:
		pass
	else:
		print("Player chose Potion")
		play("Potion")
		toggle_button_visibility()
		
# Signal from continue button
func _on_continue_pressed():
	label.text = ""
	continue_button.visible = false
	toggle_button_visibility()

