extends Node3D

@onready var animplayer = $AnimationPlayer

func _ready():
	animplayer.play("idle")

func play(animation):
	print("Playing animation: " + str(animation))
	animplayer.play(animation)

func _on_animation_player_animation_finished(anim_name):
	if anim_name != "idle":
		animplayer.play("idle")
