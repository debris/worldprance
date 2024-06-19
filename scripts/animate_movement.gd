extends Node
class_name AnimateMovement

@export var character: CharacterBody2D
@export var animation_tree: AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")

func _process(_delta):
	var direction = Input.get_axis("ui_left", "ui_right")

	if not character.is_on_floor():
		if character.double_jumped:
			animation_state.travel("DoubleJump")
		else:
			animation_state.travel("Jump")
		return

	if direction == 0:
		animation_state.travel("Idle")
	else:
		animation_state.travel("Run")
