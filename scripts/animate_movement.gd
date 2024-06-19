extends Node
class_name AnimateMovement

@export var player: Player
@export var animation_tree: AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")

func _process(_delta):
	var direction = Input.get_axis(player.input_keys.left, player.input_keys.right)

	if not player.is_on_floor():
		if player.double_jumped:
			animation_state.travel("DoubleJump")
		else:
			animation_state.travel("Jump")
		return

	if direction == 0:
		animation_state.travel("Idle")
	else:
		animation_state.travel("Run")
