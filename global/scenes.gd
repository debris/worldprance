extends Control
class_name Scenes

static var singleton: Scenes = null

var last_level_data = LevelData

@onready var center = $Origin

func _ready():
	singleton = self
	Scenes.goto_start()

func clear():
	for child in center.get_children():
		child.queue_free()

static func goto_start():	
	singleton.clear()
	var start = preload("res://scenes/ui/start.tscn").instantiate()
	singleton.center.add_child(start)

static func goto_level_select():
	singleton.clear()
	var select_level = preload("res://scenes/ui/select_level.tscn").instantiate()
	singleton.center.add_child(select_level)

static func goto_credits():
	singleton.clear()
	var credits = preload("res://scenes/ui/credits.tscn").instantiate()
	singleton.center.add_child(credits)

static func goto_level(level_data: LevelData):
	singleton.last_level_data = level_data
	singleton.clear()
	var level = preload("res://scenes/level.tscn").instantiate()
	level.level_data = level_data
	singleton.center.add_child(level)

static func restart_last_level():
	goto_level(singleton.last_level_data)

static func goto_score_screen(level_data: LevelData, this_record: LevelRecord):
	singleton.clear()
	var score_screen = preload("res://scenes/ui/score_screen.tscn").instantiate()
	score_screen.level_data = singleton.last_level_data
	score_screen.this_record = this_record
	singleton.center.add_child(score_screen)

static func goto_pause_screen():
	singleton.get_tree().paused = true
	var game_paused = preload("res://scenes/ui/game_paused.tscn").instantiate()
	singleton.get_tree().current_scene.add_child(game_paused)
	game_paused.right_panel.level_data = singleton.last_level_data
