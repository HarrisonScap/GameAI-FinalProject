extends Node3D

#@onready var game = $Control/main

func _on_wep1_pressed():
    Globals.playerWeapon = "Sword"
    get_tree().change_scene("res://Control/main.tscn")

func _on_wep2_pressed():
    Globals.playerWeapon = "Bow and Arrow"
    get_tree().change_scene("res://Control/main.tscn")

func _on_wep3_pressed():
    Globals.playerWeapon = "Mace"
    get_tree().change_scene("res://Control/main.tscn")

func _on_wep4_pressed():
    Globals.playerWeapon = "Flail"
    get_tree().change_scene("res://Control/main.tscn")

func _on_wep5_pressed():
    Globals.playerWeapon = "Spear and Shield"
    get_tree().change_scene("res://Control/main.tscn")