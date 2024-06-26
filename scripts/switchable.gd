@tool
extends Node
class_name Switchable

@export var on: bool:
	set(value):
		on = value
		if is_node_ready() && animation_player != null:
			play_animation()

@export var animation_player: AnimationPlayer

func _ready():
	if animation_player != null:
		play_animation()
		animation_player.seek(10.0)

func play_animation():
	if on:
		animation_player.play("on")
	else:
		animation_player.play("off")

func toggle():
	on = !on
