class_name spear_menu extends Node3D

# Variables for controlling the bobbing and rotation
var bobbing_speed = 2.0
var bobbing_height = 0.5
var rotation_speed = 30.0  # degrees per second
var original_position = Vector3()

func _ready():
	original_position = global_position  # Store the original position of the model

func _process(delta):
	# Rotate the model
	rotate_y(deg_to_rad(rotation_speed * delta))
		
	# Calculate the new Y position for bobbing
	var new_y = original_position.y + sin(Time.get_ticks_msec() * 0.001 * bobbing_speed) * bobbing_height

	# Update the model's position with the new Y value while keeping X and Z the same
	global_position = Vector3(original_position.x, new_y, original_position.z)
