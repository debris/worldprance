@tool
extends Node2D

@export var objects: Array[Node2D]:
	set(value):
		objects = value
		queue_redraw()

@onready var usable: Usable = $Usable

func _ready():
	if Engine.is_editor_hint():
		return

	usable.used.connect(func():
		for object in objects:
			for child in object.get_children():
				var switchable = child as Switchable
				if switchable != null:
					switchable.toggle()
	)

func _draw():
	if Engine.is_editor_hint():
		for object in objects:
			if object == null:
				return

			var point_a = Vector2(object.global_position.x - global_position.x, 0)
			var point_b = point_a + Vector2(0, object.global_position.y - global_position.y)
			draw_line(Vector2.ZERO, point_a, Color.RED, 1)
			draw_line(point_a, point_b, Color.RED, 1)
