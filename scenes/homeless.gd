@tool
extends CharacterBody2D

@export_range(1, 6, 1) var homeless_kind: float = 1:
	set(value):
		homeless_kind = value
		if is_node_ready():
			update_sprites()

var is_dead = false:
	set(value):
		if !is_dead && value:
			animation_player.play("death")	
		is_dead = value

@onready var animation_player = $AnimationPlayer
@onready var walk_sprite: Sprite2D = $WalkSprite
@onready var death_sprite: Sprite2D = $DeathSprite
@onready var patrol: Patrol = $Patrol

func _ready():
	update_sprites()

func update_sprites():
	var homeless_type = load("res://resources/homeless/" + str(homeless_kind) + ".tres")

	walk_sprite.texture = load(homeless_type.sprite_path + "/walk.png")
	death_sprite.texture = load(homeless_type.sprite_path + "/death.png")

func _on_kill_zone_body_entered(body):
	if body.velocity.y > 0.0:
		is_dead = true
		patrol.direction = 0.0
