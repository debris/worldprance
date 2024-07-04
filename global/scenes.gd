extends Node2D

var last_level_data = LevelData

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
	last_level_data = level_data
	clear()
	var level = preload("res://scenes/level.tscn").instantiate()
	level.level_data = level_data
	add_child(level)

func restart_last_level():
	goto_level(last_level_data)

func goto_score_screen(level_data: LevelData, this_record: LevelRecord):
	clear()
	var score_screen = preload("res://scenes/ui/score_screen.tscn").instantiate()
	score_screen.level_data = last_level_data
	score_screen.this_record = this_record
	add_child(score_screen)
