extends Node

func goto_level_select():
	pass

func goto_level(level_name: String):
	get_tree().change_scene_to_file("res://scenes/levels/" + level_name + ".tscn")
