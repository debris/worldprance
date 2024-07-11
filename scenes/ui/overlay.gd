extends CanvasLayer

@onready var cash_label: Label = $GridContainer/Control/CashLabel

func _ready():
	update_cash_label()
	State.collected.connect(func(_collectible, _value):
		update_cash_label()
	)

func update_cash_label():
	cash_label.text = str(100 * State.get_collectible_count("cash"))



func _on_virtual_joystick_analogic_released():
	Movement.direction = Vector2.ZERO

func _on_virtual_joystick_analogic_chage(move: Vector2):
	Movement.direction = move
