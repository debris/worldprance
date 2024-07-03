extends Node2D

@onready var label: Label = $Label

func update_time_label():
	var minutes = State.time / 60
	var seconds = fmod(State.time, 60)
	#var milliseconds = fmod(time, 1) * 100
	label.text = "%02d:%02d" % [minutes, seconds]

func _process(_delta):
	update_time_label()
