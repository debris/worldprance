extends Node
class_name AnimateMovement

@export var player: Player
@export var animation_tree: AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")

func _process(_delta):
	if Input.is_action_just_pressed(player.input_keys.attack):
		animation_state.travel("Attack")
		return

	var h_direction = Input.get_axis(player.input_keys.left, player.input_keys.right)
	var v_direction = Input.get_axis(player.input_keys.up, player.input_keys.down)

	if player.dead:
		animation_state.travel("Death")
		return

	if player.is_climbing:
		if v_direction == 0:
			animation_tree.set("parameters/Climb/TimeScale/scale", 0)
		else:
			animation_tree.set("parameters/Climb/TimeScale/scale", 1)
		animation_state.travel("Climb")
		return

	if not player.is_on_floor():
		if player.double_jumped:
			animation_state.travel("DoubleJump")
		else:
			animation_state.travel("Jump")
		return

	if h_direction == 0:
		animation_state.travel("Idle")
	else:
		animation_state.travel("Run")
