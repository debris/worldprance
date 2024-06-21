extends Node
class_name Usable

signal used

@export var area: Area2D

var players_in_range: Dictionary

func _ready():
	area.body_entered.connect(func(player):
		players_in_range[player] = null
	)

	area.body_exited.connect(func(player):
		players_in_range.erase(player)
	)

func _input(event):
	for player in players_in_range.keys():
		if event.is_action_pressed(player.input_keys.use):
			used.emit()
			return
