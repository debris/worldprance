extends Control

signal cell_selected(data: LevelData)

@export var level_data: LevelData 

@onready var tilemap = $TileMap
@onready var button = $Button
@onready var label = $Label

var sounds_on := false

func _ready():
	label.text = level_data.level_name
	enable_sound.call_deferred()

func enable_sound():
	sounds_on = true

func _on_button_pressed():
	if sounds_on:
		Sounds.play_press()
	Scenes.goto_level(level_data.scene_name)

func _on_button_mouse_entered():
	button.grab_focus()

func _on_button_mouse_exited():
	pass

func _on_button_focus_entered():
	tilemap.modulate = Color.DARK_GRAY
	if sounds_on:
		Sounds.play_hover()
	cell_selected.emit(level_data)

func _on_button_focus_exited():
	tilemap.modulate = Color.WHITE
