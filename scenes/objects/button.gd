@tool
extends Node2D

@export var cache_id: String
@export var objects: Array[Node2D]:
	set(value):
		objects = value
		queue_redraw()

@onready var usable: Usable = $Usable
@onready var switchable: Switchable = $Switchable

func _ready():
	if Engine.is_editor_hint():
		return

	usable.used.connect(func():
		Sounds.play_press()
		propagate_to_connected_objects()
	)
	
func propagate_to_connected_objects():
	for object in objects:
		for child in object.get_children():
			var child_switchable = child as Switchable
			if child_switchable != null:
				child_switchable.toggle()

func _draw():
	if Engine.is_editor_hint():
		for object in objects:
			if object == null:
				return

			var point_a = Vector2(object.global_position.x - global_position.x, 0)
			var point_b = point_a + Vector2(0, object.global_position.y - global_position.y)
			draw_line(Vector2.ZERO, point_a, Color.RED, 1)
			draw_line(point_a, point_b, Color.RED, 1)
