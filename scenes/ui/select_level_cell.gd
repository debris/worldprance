extends Control

signal cell_selected(data: LevelData)

@export var level_data: LevelData 
@export var current_stars: int:
	set(value):
		current_stars = value
		if is_node_ready():
			update_visibility()

@onready var tilemap = $TileMap
@onready var unlocked_control = $Unlocked
@onready var button = $Unlocked/Button
@onready var label = $Unlocked/Label
@onready var star = $Unlocked/Star
@onready var star2 = $Unlocked/Star2
@onready var star3 = $Unlocked/Star3

@onready var locked_control = $Locked
@onready var required_stars_label = $Locked/RequiredStarsLabel

var sounds_on := false

func _ready():
	label.text = level_data.level_name

	var level_record: LevelRecord = Records.get_level_record(level_data.level_name)
	star.is_on = level_record.task0
	star2.is_on = level_record.task1
	star3.is_on = level_record.task2

	enable_sound.call_deferred()
	update_visibility()

func update_visibility():
	var is_unlocked = current_stars >= level_data.required_stars
	unlocked_control.visible = is_unlocked
	locked_control.visible = !is_unlocked
	required_stars_label.text = str(current_stars) + "/" + str(level_data.required_stars)
	if is_unlocked:
		if button.has_focus():
			tilemap.modulate = Color.GREEN
		else:
			tilemap.modulate = Color.WHITE
	else:
		tilemap.modulate = Color.DARK_GRAY

func enable_sound():
	sounds_on = true

func _on_button_pressed():
	if sounds_on:
		Sounds.play_press()
	Scenes.goto_level(level_data)

#func _on_button_mouse_entered():
#	button.grab_focus()

func _on_button_mouse_exited():
	pass

func _on_button_focus_entered():
	tilemap.modulate = Color.GREEN
	if sounds_on:
		Sounds.play_hover()
	cell_selected.emit(level_data)

func _on_button_focus_exited():
	tilemap.modulate = Color.WHITE
