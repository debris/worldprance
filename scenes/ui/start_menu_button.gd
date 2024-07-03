extends Button

func _ready():
	delayed_ready.call_deferred()

# after delay, so the sounds are not played when the button appears on the screan
func delayed_ready():
	focus_entered.connect(func():
		Sounds.play_hover()
	)

	pressed.connect(func():
		Sounds.play_press()
	)
