extends Node2D

@onready var collision_shape = $StaticBody2D/CollisionShape2D

var players = {}

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	for player in players.keys():
		if InputManager.get_direction().y > 0.2:
			collision_shape.disabled = true
			await get_tree().create_timer(1.0).timeout
			collision_shape.disabled = false

func _on_player_entered(body: Player):
	players[body] = null

func _on_player_exited(body: Player):
	players[body] = null
	players.erase(body)
