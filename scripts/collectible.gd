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
		collectible.queue_free()
	)
