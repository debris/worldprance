extends Node2D

@export var number: int: 
	set(value):
		number = value
		if is_node_ready():
			update_label()

@onready var label = $Label

func _ready():
	update_label()

func update_label():
	label.text = str(number)
