extends Camera2D

func _ready():
	setup.call_deferred()

func setup():
	position_smoothing_enabled = true
