extends Node
class_name Collectible

@export var collectible: Node2D
@export var area: Node2D

func _ready():
	area.body_entered.connect(func(_body): 
		collectible.queue_free()
	)
