#Globals.gd
extends Node

# Weapon definitions
var weapons = {
    "Sword": {
        "Swing": {"damage": 15, "Stamina": -15, "description": "Swing your sword, deal 15 damage"},
        "Riposte": {"damage": 15, "Stamina": -30, "description": " Block and attack deal 15 damage"}
    },
    "Bow and Arrow": {
        "Shoot": {"damage": 10, "Stamina": -20, "description": "Shoot your bow, deal 10 damage"},
        "Quick shoot": {"damage": 7, "Stamina": -20, "description": "Quickly shoot your bow, deal 7 damage"}
    },
    "Mace": {
        "Hit": {"damage": 25, "Stamina": -20, "description": "Hit with your mace, deal 15 damage"},
        "Break Shield": {"damage": 15, "Stamina": -30,"description": "Break Enemy's shield, deal 15 damage"}
    },

    "Flail": {
        "Swing": {"damage": 20, "Stamina": -20, "description": "Swing your flail, deal 20 damage"},
        "Whirlwind": {"damage": 25, "Stamina": -25, "description": "Perform a Whirlwind attack, deal 25 damage"}
    },

    "Spear and Shield": {
        "Stab": {"damage": 15, "Stamina": -15, "description": "Stab with your spear, deal 15 damage"},
        "Block": {"damage": 0, "Stamina": -15, "description": "Block with your shield, deal 0 damage"}
    }

}


# Player and Enemy weapons
var player_weapon = ""
var enemy_weapon = ""