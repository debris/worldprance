extends Node
class_name PauseGame

@export var level_data: LevelData

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Scenes.goto_pause_screen()
