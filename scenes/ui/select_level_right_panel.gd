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
@onready var star = $GridContainer/Control/Star
@onready var star2 = $GridContainer/Control2/Star
@onready var star3 = $GridContainer/Control3/Star

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

	var level_record: LevelRecord = Records.get_level_record(level_data.level_name)
	star.is_on = level_record.task0
	star2.is_on = level_record.task1
	star3.is_on = level_record.task2


func _on_start_button_pressed():
	pass
	#print("goto: " + level_data.scene_name)
	Scenes.goto_level(level_data)
