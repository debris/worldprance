@tool
extends Node
class_name Switchable

@export var on: bool:
	set(value):
		on = value
		if is_node_ready():
			play_animation()
			save_to_cache()

@export var animation_player: AnimationPlayer

func _ready():
	if Engine.is_editor_hint():
		return

	load_from_cache()

func load_from_cache():
	var parent = get_parent()
	if "cache_id" in parent && parent.cache_id!= null && parent.cache_id != "":
		var value = State.get_from_cache(parent.cache_id)
		if value != null:
			set_instant(value)
		else:
			set_instant(on)
	else:
		set_instant(on)

func save_to_cache():
	var parent = get_parent()
	if "cache_id" in parent && parent.cache_id!= null && parent.cache_id != "":
		State.store_in_cache(parent.cache_id, on)

func play_animation():
	if on:
		animation_player.play("on")
	else:
		animation_player.play("off")

func toggle():
	on = !on

func set_instant(value: bool):
	on = value
	animation_player.seek(10.0)
