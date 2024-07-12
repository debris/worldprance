# 'is_just_pressed' extension for Button
extends Node
class_name IsJustPressed

@export var button: Button:
	set(value):
		button = value
		if is_node_ready():
			connect_button()

var just_pressed := false
var emitted := false

func is_just_pressed() -> bool:
	return just_pressed

func _ready():
	connect_button()

func connect_button():
	button.button_down.connect(func():
		just_pressed = true
	)

# always keep is_just_pressed for 1 tick
func _process(_delta):
	if emitted == false:
		emitted = just_pressed
	else:
		just_pressed = false
