extends Node
class_name ChangeLevel

@export var level: Node2D
@export var game_level: GameLevel

var left_level: GameLevel
var up_level: GameLevel

func _ready():
	if game_level.left != null && !game_level.left.is_empty():
		left_level = load_game_level(game_level.left)
	if game_level.up != null && !game_level.up.is_empty():
		up_level = load_game_level(game_level.up)

func _process(_delta):
	for child in level.get_children():
		var player = child as Player
		if player == null:
			continue
	
		if !game_level.dimension.is_empty() && game_level.dimension != null && Input.is_action_just_pressed(player.input_keys.dimension):
			change_level(player.player_name, game_level.dimension, Vector2.ZERO)
			return

		if player.position.x > game_level.size.x:
			change_level(player.player_name, game_level.right, Vector2(-game_level.size.x, 0))
			return
		elif player.position.x < 0 && left_level != null:
			change_level(player.player_name, game_level.left, Vector2(left_level.size.x, 0))
			return
		elif player.position.y < 0 && up_level != null:
			change_level(player.player_name, game_level.up, Vector2(0.0, up_level.size.y))
			return
		elif player.position.y > game_level.size.y:
			change_level(player.player_name, game_level.down, Vector2(0.0, -game_level.size.y))
			return

func load_game_level(level_name: String) -> GameLevel:
	return load("resources/map/" + level_name + ".tres")

func change_level(player_name: String, level_name: String, change: Vector2):
	if level_name == null || level_name.length() == 0:
		return

	var player_data = State.get_player_data(player_name)
	player_data.position += change
	get_tree().change_scene_to_file("scenes/levels/" + level_name + ".tscn")
	
