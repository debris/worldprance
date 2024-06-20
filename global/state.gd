extends Node

var player_data_by_name: Dictionary

func get_player_data(player_name: String) -> PlayerData:
	return player_data_by_name.get(player_name)

func update_player_data(player_name: String, player_data: PlayerData):
	player_data_by_name[player_name] = player_data
