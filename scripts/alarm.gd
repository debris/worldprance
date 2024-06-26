extends Node
class_name Alarm

@export var walls: Node2D

var started = false
var stream = AudioStreamPlayer2D.new()

func _ready():
	stream.stream = preload("res://assets/sounds/siren.mp3")
	add_child(stream)

func start():
	if started:
		return

	started = true
	var tween = create_tween()
	tween.set_loops()
	tween.tween_property(walls, "modulate", Color.RED, 1.0)
	tween.tween_property(walls, "modulate", Color.WHITE, 1.0)

	stream.play()
