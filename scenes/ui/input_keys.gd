extends Node2D

@export var input_keys: GameInput

@onready var jump_cell: Control = $GridContainer/Jump
@onready var use_cell: Control = $GridContainer/Use
@onready var hit_cell: Control = $GridContainer/Hit
@onready var alt_cell: Control = $GridContainer/Alt

func _ready():
	InputManager.jump.connect(func():
		modulate_press(jump_cell)
	)

	InputManager.use.connect(func():
		modulate_press(use_cell)
	)

	InputManager.attack.connect(func():
		modulate_press(hit_cell)
	)

	InputManager.special.connect(func():
		modulate_press(alt_cell)
	)

func modulate_press(control: Control):
	var tween = create_tween()
	tween.tween_property(control, "modulate", Color.DARK_GRAY, 0.01)
	tween.tween_property(control, "modulate", Color.DARK_GRAY, 0.3)
	tween.tween_property(control, "modulate", Color.WHITE, 0.01)
