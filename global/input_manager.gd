extends Node

signal jump
signal use
signal special
signal attack

@export var virtual_joystick: Node = null:
	set(value):
		virtual_joystick = value
		if is_node_ready():
			register_joystick()

@export var virtual_pad: Node = null:
	set(value):
		virtual_pad = value
		if is_node_ready():
			register_pad()

var input_keys: GameInput = preload("res://resources/inputs/default.tres")
var direction := Vector2.ZERO
var mobile := false

func get_direction() -> Vector2:
	return direction

func is_mobile() -> bool:
	return mobile

func _ready():
	if OS.has_feature("mobile"):
		mobile = true

func register_joystick():
	if virtual_joystick == null:
		return

	# reset the direction
	direction = Vector2.ZERO

	virtual_joystick.analogic_chage.connect(func(move):
		direction = move
	)

	virtual_joystick.analogic_released.connect(func():
		direction = Vector2.ZERO		
	)

func register_pad():
	if virtual_pad == null:
		return

	virtual_pad.bottom_pressed.connect(func():
		jump.emit()
	)

	virtual_pad.left_pressed.connect(func():
		use.emit()	
	)

	virtual_pad.top_pressed.connect(func():
		special.emit()		
	)

func _process(_delta):
	if mobile:
		return

	var x_direction = Input.get_axis(input_keys.left, input_keys.right)
	var y_direction = Input.get_axis(input_keys.up, input_keys.down)

	direction = Vector2(x_direction, y_direction)

	if Input.is_action_just_pressed(input_keys.jump):
		jump.emit()
	
	if Input.is_action_just_pressed(input_keys.use):
		use.emit()

	if Input.is_action_just_pressed(input_keys.dimension):
		special.emit()

	if Input.is_action_just_pressed(input_keys.attack):
		attack.emit()
