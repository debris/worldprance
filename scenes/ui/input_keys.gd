extends Control

@export var input_keys: GameInput

@onready var jump_cell: Control = $GridContainer/Jump
@onready var use_cell: Control = $GridContainer/Use
@onready var hit_cell: Control = $GridContainer/Hit
@onready var alt_cell: Control = $GridContainer/Alt

func _process(_delta):
	jump_cell.modulate = Color.WHITE
	use_cell.modulate = Color.WHITE
	hit_cell.modulate = Color.WHITE
	alt_cell.modulate = Color.WHITE

	if Actions.is_jump_pressed():
		jump_cell.modulate = Color.DARK_GRAY
	if Actions.is_use_pressed():
		use_cell.modulate = Color.DARK_GRAY
	if Input.is_action_pressed(input_keys.attack):
		hit_cell.modulate = Color.DARK_GRAY
	if Input.is_action_pressed(input_keys.dimension):
		alt_cell.modulate = Color.DARK_GRAY
		State.collect("swap")
	