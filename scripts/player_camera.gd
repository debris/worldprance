extends Camera2D

func _ready():
	setup.call_deferred()

func setup():
	position_smoothing_enabled = true
	zoom = Vector2(1.5, 1.5)

	#var tween = create_tween()
	#tween.tween_property(self, "zoom", Vector2(1.5, 1.5), 1.0)
