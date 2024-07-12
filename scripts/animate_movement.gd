extends Node
class_name AnimateMovement

@export var player: Player
@export var animation_tree: AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")

func _ready():
	InputManager.attack.connect(func():
		if player.dead:
			return
		animation_state.travel("Attack")
	)

func _process(_delta):
	if player.dead:
		animation_state.travel("Death")
		return

	if player.is_climbing:
		if InputManager.get_direction().y == 0:
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

	if InputManager.get_direction().x == 0:
		animation_state.travel("Idle")
	else:
		animation_state.travel("Run")
