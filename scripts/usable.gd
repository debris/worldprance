extends Node
class_name Usable

signal used

@export var area: Area2D

var players_in_range: Dictionary

func _ready():
	var press_to_use = preload("res://scenes/ui/press_to_use.tscn").instantiate()
	press_to_use.visible = false
	area.add_child(press_to_use)
	press_to_use.position = Vector2(8.0, -8.0)

	area.body_entered.connect(func(player):
		players_in_range[player] = null
		press_to_use.visible = true
	)

	area.body_exited.connect(func(player):
		players_in_range.erase(player)
		if players_in_range.is_empty():
			press_to_use.visible = false
	)

func _input(event):
	for player in players_in_range.keys():
		if event.is_action_pressed(player.input_keys.use):
			used.emit()
			return
