extends CanvasLayer

@onready var virtual_joystick = $VirtualJoystick
@onready var virtual_pad = $VirtualPad
@onready var cash_label: Label = $GridContainer/Control/CashLabel
@onready var input_keys: Node2D = $InputKeys

func _ready():
	if InputManager.is_mobile():
		input_keys.visible = false
		InputManager.virtual_joystick = virtual_joystick
		InputManager.virtual_pad = virtual_pad
	else:
		virtual_joystick.visible = false
		virtual_pad.visible = false

	update_cash_label()
	State.collected.connect(func(_collectible, _value):
		update_cash_label()
	)

func update_cash_label():
	cash_label.text = str(100 * State.get_collectible_count("cash"))


func _on_pause_button_pressed():
	Scenes.goto_pause_screen()
