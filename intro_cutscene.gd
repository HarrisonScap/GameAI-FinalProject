extends Node3D

@onready var camera = $Camera3D
@onready var camera2 = $Camera3D2

var starting_pos

func _ready():
	starting_pos = camera.position.x
	camera2.make_current()

func _process(delta):
	await get_tree().create_timer(5).timeout
	camera.make_current()
	
	camera.position.x = lerp(camera.position.x,starting_pos+250,.003)
	if camera.position.x >= starting_pos+175:
		get_tree().change_scene_to_file("res://main.tscn")
	
