extends Panel

@export var level_data: LevelData:
	set(value):
		level_data = value
		if is_node_ready():
			_update_data()

@onready var title_label: Label = $TitleLabel
@onready var task0: Label = $GridContainer/Task0
@onready var task1: Label = $GridContainer/Task1
@onready var task2: Label = $GridContainer/Task2

func _ready():
	_update_data()

func _update_data():
	if level_data == null:
		print_debug("should not be null")
		return

	title_label.text = level_data.level_name
	task0.text = level_data.task0
	task1.text = level_data.task1
	task2.text = level_data.task2


func _on_start_button_pressed():
	pass
	#print("goto: " + level_data.scene_name)
	Scenes.goto_level(level_data)
