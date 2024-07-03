extends Node2D

@onready var back_button = $BackButton

func _ready():
	back_button.grab_focus()

func _on_back_button_pressed():
	Scenes.goto_start()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Scenes.goto_start()
