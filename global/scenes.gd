extends Node

func goto_start():
	get_tree().change_scene_to_file("res://scenes/ui/start.tscn")

func goto_level_select():
	get_tree().change_scene_to_file("res://scenes/ui/select_level.tscn")

func goto_level(level_name: String):
	get_tree().change_scene_to_file("res://scenes/levels/" + level_name + ".tscn")
