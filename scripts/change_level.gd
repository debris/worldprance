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
			get_tree().change_scene_to_file("scenes/levels/" + game_level.right + ".tscn")
		elif player.position.x < 0:
			# move left if possible
			get_tree().change_scene_to_file("scenes/levels/" + game_level.left + ".tscn")
