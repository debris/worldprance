extends Node

func save_path(level_name: String) -> String:
	return "user://level_record_" + level_name + ".tscn"

func get_level_record(level_name: String) -> LevelRecord:
	var filename = save_path(level_name)
	if ResourceLoader.exists(filename):
		return ResourceLoader.load(filename, "", ResourceLoader.CACHE_MODE_IGNORE)
	return LevelRecord.new()

func save_level_record(level_name: String, level_record: LevelRecord):
	# TODO: update instead of overwrite ?
	
	ResourceSaver.save(level_record, save_path(level_name))
