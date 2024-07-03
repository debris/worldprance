extends Node2D

@onready var start_button = $Menu/StartButton

func _ready():
	start_button.grab_focus()

func _on_start_button_pressed():
	Scenes.goto_level_select()

func _on_settings_button_pressed():
	pass # Replace with function body.

func _on_credits_button_pressed():
	Scenes.goto_credits()

func _on_quit_button_pressed():
	get_tree().quit()
