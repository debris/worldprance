extends Node2D

signal player_detected

@onready var area: Area2D = $Area2D
@onready var switchable: Switchable = $Switchable

var detected_label: Label = preload("res://scenes/ui/detected.tscn").instantiate()

func _ready():
	detected_label.visible = false
	add_child(detected_label)
	detected_label.position = Vector2(8.0, 8.0)

	area.body_entered.connect(func(_body):
		if switchable.on:
			player_detected.emit()
			detected_label.visible = true
	)
