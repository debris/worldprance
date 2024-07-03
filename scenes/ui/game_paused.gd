extends CanvasLayer

@onready var button_no: Button = $GridContainer/ButtonNo

func _ready():
	button_no.grab_focus()

func _on_button_no_pressed():
	get_tree().paused = false
	queue_free()

func _on_button_yes_pressed():
	get_tree().paused = false
	Scenes.goto_level_select()

#func _input(event):
#	if event.is_action_pressed("ui_cancel"):
	#d	_on_button_no_pressed()
