extends Node

@export var direction := Vector2.ZERO
var jump_pressed = null

var is_mobile: bool = false
var input_keys: GameInput = preload("res://resources/inputs/default.tres")

func _ready():
	if OS.has_feature("mobile"):
		is_mobile = true

func _process(_delta):
	if is_mobile:
		return

	var x_direction = Input.get_axis(input_keys.left, input_keys.right)
	var y_direction = Input.get_axis(input_keys.up, input_keys.down)

	direction = Vector2(x_direction, y_direction)

func is_jump_pressed() -> bool:
	#if is_mobile:
		if jump_pressed != null:
			return jump_pressed.call()
		else:
			return false
	#return Input.is_action_just_pressed(input_keys.jump)

func is_use_pressed() -> bool:
	if is_mobile:
		return false
	return Input.is_action_just_pressed(input_keys.use)
