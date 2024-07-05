extends Node2D

@export var level_data: LevelData:
	set(value):
		level_data = value
		if is_node_ready():
			update_data()

@export var this_record: LevelRecord:
	set(value):
		this_record = value
		if is_node_ready():
			update_this_record()

@onready var time_label = $BestRecord/TimeLabel
@onready var cash_label = $BestRecord/CashLabel
@onready var best_star0 = $BestRecord/Control/Star
@onready var best_star2 = $BestRecord/Control2/Star
@onready var best_star3 = $BestRecord/Control3/Star

@onready var this_time_label = $ThisRecord/TimeLabel
@onready var this_cash_label = $ThisRecord/CashLabel
@onready var this_star0 = $ThisRecord/Control/Star
@onready var this_star2= $ThisRecord/Control2/Star
@onready var this_star3 = $ThisRecord/Control3/Star

@onready var task_label0 = $Info/TaskLabel
@onready var task_label1 = $Info/TaskLabel1
@onready var task_label2 = $Info/TaskLabel2

@onready var back_button = $BackButton
@onready var animation_player = $AnimationPlayer

func _ready():
	update_data()
	update_this_record()

	back_button.grab_focus()
	animation_player.play("present")

func update_data():
	var level_record: LevelRecord = Records.get_level_record(level_data.level_name)

	var minutes = level_record.best_time / 60
	var seconds = fmod(level_record.best_time, 60)
	time_label.text = "%02d:%02d" % [minutes, seconds]
	cash_label.text = str(100 * level_record.cash)

	best_star0.is_on = level_record.task0
	best_star2.is_on = level_record.task1
	best_star3.is_on = level_record.task2

	task_label0.text = level_data.task0
	task_label1.text = level_data.task1
	task_label2.text = level_data.task2

func update_this_record():
	var level_record = this_record
	
	var minutes = level_record.best_time / 60
	var seconds = fmod(level_record.best_time, 60)
	this_time_label.text = "%02d:%02d" % [minutes, seconds]
	this_cash_label.text = str(100 * level_record.cash)

	this_star0.is_on = level_record.task0
	this_star2.is_on = level_record.task1
	this_star3.is_on = level_record.task2

func _on_back_button_pressed():
	Scenes.goto_level_select()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Scenes.goto_level_select()

func play_appear_sound():
	Sounds.play_appear()
