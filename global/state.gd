extends Node

signal collected(collectible: String, value: int)
signal finished(level_record: LevelRecord)

var time: float
var player_data_by_name: Dictionary
var value_by_collectible: Dictionary
var cached_values: Dictionary

func reset():
	time = 0.0
	player_data_by_name.clear()
	value_by_collectible.clear()
	cached_values.clear()

func get_player_data(player_name: String) -> PlayerData:
	return player_data_by_name.get(player_name)

func update_player_data(player_name: String, player_data: PlayerData):
	player_data_by_name[player_name] = player_data

func collect(collectible: String):
	var value = get_collectible_count(collectible)
	value += 1
	value_by_collectible[collectible] = value
	collected.emit(collectible, value)

func get_collectible_count(collectible: String) -> int:
	var value = value_by_collectible.get(collectible)
	if value == null:
		return 0
	return value
	
func store_in_cache(key: String, value):
	cached_values[key] = value

func get_from_cache(key: String):
	return cached_values.get(key)

func _process(delta):
	time += delta

func finish(level_record: LevelRecord):
	finished.emit(level_record)
