extends Node
class_name LookAt

@export var player: Player
@export var sprite: Sprite2D

func _process(_delta):
	if player.dead:
		return

	var direction = Input.get_axis(player.input_keys.left, player.input_keys.right)
	if direction > 0:
		sprite.scale.x = 1.0		
	elif direction < 0:
		sprite.scale.x = -1.0
