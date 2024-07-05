@tool
extends Sprite2D

@export var is_on: bool = false:
	set(value):
		is_on = value
		if is_node_ready():
			update_sprite()

func _ready():
	update_sprite()

func update_sprite():
	if is_on:
		modulate = Color.WHITE
	else:
		modulate = Color.BLACK
