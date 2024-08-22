extends Node3D

#@onready var game = $Control/main
@onready var music = $AudioStreamPlayer

func _process(delta):
	if !music.playing:
		music.play()

func _on_weapon_1_pressed():
	Globals.playerWeapon = "Sword"
	get_tree().change_scene_to_file("res://main.tscn")


func _on_weapon_2_pressed():
	Globals.playerWeapon = "Spear and Shield"
	get_tree().change_scene_to_file("res://main.tscn")

func _on_weapon_3_pressed():
	Globals.playerWeapon = "Mace"
	get_tree().change_scene_to_file("res://main.tscn")
