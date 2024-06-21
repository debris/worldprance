@tool
extends Node
class_name Switchable

@export var on: bool:
	set(value):
		on = value
		if is_node_ready():
			play_animation()

@export var animation_player: AnimationPlayer

func _ready():
	play_animation()

func play_animation():
	if on:
		animation_player.play("on")
	else:
		animation_player.play("off")

func toggle():
	on = !on
