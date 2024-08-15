extends Node2D

@onready var moveForwardButton = $moveForwardButton
@onready var moveBackButton = $moveBackButton

@onready var attackButton = $attackButton

@onready var you = $You
@onready var enemy = $Enemy/Sprite2D

@onready var sword = $You/sword

@onready var enemy_health_label = $Enemy/Label

var enemy_health = 10

var swing = false
var sword_pos

func _ready():
	sword_pos = sword.position.x

func _process(delta):
	
	# sword animation
	if swing:
		sword.position.x = lerp(sword.position.x,sword.position.x+5,.5)
		#print(sword.position.x)
		if sword.position.x > sword_pos+20:
			swing = false
	elif sword.position.x != sword_pos:
		sword.position.x = lerp(sword.position.x,sword_pos,.5)

func _on_move_forward_button_pressed():
	you.move_local_x(25)

func _on_move_back_button_pressed():
	you.move_local_x(-25)

func _on_attack_button_pressed():
	sword.position.x = sword_pos
	swing = true
	#print(you.position.distance_to(enemy.position))
	#print(you.global_transform.origin.distance_to(enemy.global_transform.origin))
	if you.global_transform.origin.distance_to(enemy.global_transform.origin) < 100:
		enemy_health -= 2
		enemy_health_label.text = str(enemy_health) + "/10"
	
