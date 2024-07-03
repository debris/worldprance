extends Node2D

@export var level_data: LevelData:
	set(value):
		level_data = value
		if is_node_ready():
			start()

@onready var pause_game: PauseGame = $PauseGame

var loaded_a: Node2D
var loaded_b: Node2D

func _ready():
	start()

	State.finished.connect(func(level_record):
		Records.save_level_record(level_data.level_name, level_record)
		Scenes.goto_level_select()
	)

func start():
	if level_data == null:
		return

	if loaded_a != null:
		loaded_a.queue_free()
		loaded_a = null

	if loaded_b != null:
		loaded_b.queue_free()
		loaded_b = null

	loaded_a = load("res://scenes/levels/" + level_data.scene_name +".tscn").instantiate()
	add_child(loaded_a)
	pause_game.level_data = level_data

func swap_dimensions():
	if loaded_a == null:
		loaded_b.queue_free()
		loaded_b = null
		loaded_a = load("res://scenes/levels/" + level_data.scene_name +".tscn").instantiate()
		add_child(loaded_a)
	else:
		loaded_a.queue_free()
		loaded_a = null
		loaded_b = load("res://scenes/levels/" + level_data.scene2_name +".tscn").instantiate()
		add_child(loaded_b)

func _process(_delta):
	var loaded = null
	if loaded_a != null:
		loaded = loaded_a
	else:
		loaded = loaded_b

	for child in loaded.get_children():
		var player = child as Player
		if player == null:
			continue

		if Input.is_action_just_pressed(player.input_keys.dimension):
			swap_dimensions()
	