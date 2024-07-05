extends Node
class_name LookAt

@export var player: CharacterBody2D
@export var sprite: Sprite2D

func _process(_delta):
	if "dead" in player && player.dead:
		return

	var direction = player.velocity.x
	if direction > 0:
		sprite.scale.x = 1.0		
	elif direction < 0:
		sprite.scale.x = -1.0
