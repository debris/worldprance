extends Node
class_name ChangeLevel

@export var level: Node2D
@export var game_level: GameLevel

func _process(_delta):
	for child in level.get_children():
		var player = child as Player
		if player == null:
			continue
	
		if player.position.x > 1152:
			# move right if possible
			change_level(player.player_name, game_level.right, Vector2(-1152.0, 0))
			return
		elif player.position.x < 0:
			# move left if possible
			change_level(player.player_name, game_level.left, Vector2(1152.0, 0))
			return
		elif player.position.y < 0.0:
			change_level(player.player_name, game_level.up, Vector2(0.0, 648.0))
			return
		elif player.position.y > 648.0:
			change_level(player.player_name, game_level.down, Vector2(0.0, -648.0))
			return

func change_level(player_name: String, level_name: String, change: Vector2):
	if level_name == null || level_name.length() == 0:
		return

	var player_data = State.get_player_data(player_name)
	player_data.position += change
	get_tree().change_scene_to_file("scenes/levels/" + level_name + ".tscn")
	
