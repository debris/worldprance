extends Node
class_name PauseGame

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = true
		var game_paused = preload("res://scenes/ui/game_paused.tscn").instantiate()
		get_tree().current_scene.add_child(game_paused)
		#accept_event()
