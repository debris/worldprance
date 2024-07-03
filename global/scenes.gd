extends Node2D

func clear():
	for child in get_children():
		child.queue_free()

func goto_start():
	clear()
	var start = preload("res://scenes/ui/start.tscn").instantiate()
	add_child(start)

func goto_level_select():
	clear()
	var select_level = preload("res://scenes/ui/select_level.tscn").instantiate()
	add_child(select_level)

func goto_credits():
	clear()
	var credits = preload("res://scenes/ui/credits.tscn").instantiate()
	add_child(credits)

func goto_level(level_data: LevelData):
	clear()
	var level = preload("res://scenes/level.tscn").instantiate()
	level.level_data = level_data
	add_child(level)
