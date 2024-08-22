extends Node3D

func _ready():
	animplayer.play("idle")

func play(animation):
	print("Playing animation: " + str(animation))
	animplayer.play(animation)


	if anim_name != "idle" and anim_name != "death":
		animplayer.play("idle")


func _on_animation_player_animation_finished(anim_name):
	pass # Replace with function body.
