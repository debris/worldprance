extends Node
class_name LookAt

@export var sprite: Sprite2D

func _process(_delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction > 0:
		sprite.scale.x = 1.0		
	elif direction < 0:
		sprite.scale.x = -1.0
