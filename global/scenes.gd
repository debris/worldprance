extends Node

func goto_start():
	get_tree().change_scene_to_file("res://scenes/ui/start.tscn")

func goto_level_select():
	get_tree().change_scene_to_file("res://scenes/ui/select_level.tscn")

func goto_level(level_data: LevelData):
	get_tree().change_scene_to_file("res://scenes/level.tscn")
	await get_tree().tree_changed
	var level = get_tree().current_scene
	level.level_data = level_data
