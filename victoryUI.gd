extends Control

@onready var victoryLabel = $victoryLabel
@onready var roundLabel = $roundLabel

@onready var player = $"../Control/Player"

func victory_text(enemyName):
	victoryLabel.text = str(enemyName) + " has Fallen!"
	roundLabel.text = "Rounds won: " + str(player.fights_won)
