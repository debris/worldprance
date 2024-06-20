extends CanvasLayer

@onready var cash_label: Label = $MarginContainer/GridContainer/CashLabel

func _ready():
	update_cash_label()
	State.collected.connect(func(_collectible, _value):
		update_cash_label()
	)

func update_cash_label():
	cash_label.text = "cash: " + str(State.get_collectible_count("cash"))
