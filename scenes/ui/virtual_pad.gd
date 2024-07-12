extends Node2D

signal bottom_pressed
signal left_pressed
signal top_pressed

func _on_bottom_button_pressed():
	bottom_pressed.emit()

func _on_left_button_pressed():
	left_pressed.emit()

func _on_top_button_pressed():
	top_pressed.emit()
