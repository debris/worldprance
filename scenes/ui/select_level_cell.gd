extends Control

signal cell_selected(data: LevelData)

@export var level_data: LevelData 

@onready var tilemap = $TileMap
@onready var button = $Button
@onready var label = $Label

func _ready():
	label.text = level_data.level_name

func _on_button_pressed():
	button.grab_focus()

func _on_button_mouse_entered():
	button.grab_focus()

func _on_button_mouse_exited():
	pass

func _on_button_focus_entered():
	tilemap.modulate = Color.CYAN
	cell_selected.emit(level_data)

func _on_button_focus_exited():
	tilemap.modulate = Color.WHITE
