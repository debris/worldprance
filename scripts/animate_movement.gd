extends Node
class_name AnimateMovement

@export var animation_tree: AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")

func _process(_delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction == 0:
		animation_state.travel("Idle")
	else:
		animation_state.travel("Run")
