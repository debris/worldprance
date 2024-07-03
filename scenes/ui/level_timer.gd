extends Node2D

@onready var label: Label = $Label

var time := 0.0:
	set(value):
		time = value
		update_time_label()

func update_time_label():
	var minutes = time / 60
	var seconds = fmod(time, 60)
	#var milliseconds = fmod(time, 1) * 100
	label.text = "%02d:%02d" % [minutes, seconds]

func _process(delta):
	time += delta
