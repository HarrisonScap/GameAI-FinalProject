#Globals.gd
extends Node

# Weapon definitions
var weapons = {
	"Sword": {
		"Swing": {"damage": 15, "Stamina": 15, "description": "Swing your sword, deal 15 damage"},
		"Riposte": {"damage": 15, "Stamina": 30, "description": "Block and attack deal 15 damage"},
		"Spin Attack": {"damage": 20, "Stamina": 40, "description": "Spin around and deal 20 damage, cannot be blocked"}
	},
	"Spear and Shield": {
		"Stab": {"damage": 10, "Stamina": 15, "description": "Stab with your spear, deal 10 damage and start bleeding"}, # bleeding 
		"Shield Block": {"damage": 0, "Stamina": 15, "description": "Block with your shield, deal 0 damage"},
		"Shield Bash": {"damage": 10, "Stamina": 40, "description": "Slam your shield at the enemy, stunning them"} # stun
	},
	"Mace": {
		"Hit": {"damage": 25, "Stamina": 20, "description": "Hit with your mace, deal 25 damage"},
		"Break Shield": {"damage": 15, "Stamina": 30, "description": "Negate enemy's block, dealing 15 damage"}, # break shield
		"Ground Slam": {"damage": 0, "Stamina": 15, "description": "Slam the ground stunning enemy for 1 turn"} #stun for one tu
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


# Player and Enemy weapons
var playerWeapon
var enemyWeapon
