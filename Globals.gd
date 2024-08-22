#Globals.gd
extends Node


# Weapon and sounds definitions
var weapons = {
	"Sword": {
		"Swing": {"damage": 15, "Stamina": 15, "description": "Swing your sword, deal 15 damage"},#, "sound": "res://assets/audio/sword_swing.wav"},
		"Riposte": {"damage": 15, "Stamina": 30, "description": "Block and attack deal 15 damage"},#, "sound": "res://assets/audio/sword_riposte.wav"},
		"Spin Attack": {"damage": 20, "Stamina": 40, "description": "Spin around and deal 20 damage, cannot be blocked"}#, "sound": "res://assets/audio/sword_spin_attack.wav"}
	},
	"Spear and Shield": {
		"Stab": {"damage": 10, "Stamina": 15, "description": "Stab with your spear, deal 10 damage and start bleeding"},#, "sound": "res://assets/audio/spear_stab.wav"},
		"Shield Block": {"damage": 0, "Stamina": 15, "description": "Block with your shield, deal 0 damage"},#, "sound": "res://assets/audio/shield_block.wav"},
		"Shield Bash": {"damage": 10, "Stamina": 40, "description": "Slam your shield at the enemy, stunning them"},#, "sound": "res://assets/audio/shield_bash.wav"}
	},
	"Mace": {
		"Hit": {"damage": 25, "Stamina": 20, "description": "Hit with your mace, deal 25 damage"},#, "sound": "res://assets/audio/mace_hit.wav"},
		"Break Shield": {"damage": 15, "Stamina": 30, "description": "Negate enemy's block, dealing 15 damage"},#, "sound": "res://assets/audio/mace_break_shield.wav"},
		"Ground Slam": {"damage": 0, "Stamina": 15, "description": "Slam the ground stunning enemy for 1 turn"}#, "sound": "res://assets/audio/mace_ground_slam.wav"}
	}
}



var damage_moves = ["Swing","Spin Attack", "Stab", "Shield Bash", "Hit", "Break Shield", "Ground Slam"]
var block_moves = ["Block", "Riposte", "Shield Block"]
var stun_moves = ["Shield Bash", "Ground Slam"]
var bleed_moves = ["Stab"]
var unblockable_moves = ["Spin Attack", "Break Shield"]

#
	#"Bow and Arrow": {
		#"Shoot": {"damage": 10, "Stamina": -20, "description": "Shoot your bow, deal 10 damage"},
		#"Quick shoot": {"damage": 7, "Stamina": -20, "description": "Quickly shoot your bow, deal 7 damage"}
	#},
#
	#"Flail": {
		#"Swing": {"damage": 20, "Stamina": -20, "description": "Swing your flail, deal 20 damage"},
		#"Whirlwind": {"damage": 25, "Stamina": -25, "description": "Perform a Whirlwind attack, deal 25 damage"}
	#}
#
#
#
#

# Animation for the enemy
var enemyAnimation = "idle"

# Player Attributes
var playerHealth
var playerStamina
var playerWeapon
var playerStun
var playerBleed
var playerBleedTurns
var playerPotions


# Enemy Attributes
var enemyHealth
var enemyStamina
var enemyWeapon
var enemyStun
var enemyBleed
var enemyBleedTurns
var enemyPotions

var enemyMove # The move the enemy will choose

var potionHeal = 10 #the amount of health restored by a potion
