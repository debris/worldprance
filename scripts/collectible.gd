extends Node
class_name Collectible

signal collected

@export var collectible_name: String
@export var collectible: Node2D
@export var area: Node2D

func _ready():
	area.body_entered.connect(func(_body): 
		State.collect(collectible_name)
		collected.emit()

		var stream = AudioStreamPlayer2D.new()
		stream.stream = preload("res://assets/sounds/pop.mp3")
		collectible.get_parent().add_child(stream)
		stream.play()

		collectible.queue_free()
		await stream.finished
		stream.queue_free()
	)
