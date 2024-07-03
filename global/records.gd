extends Node

func save_path(level_name: String) -> String:
	return "user://level_record_" + level_name.to_snake_case() + ".tres"

func get_level_record(level_name: String) -> LevelRecord:
	var filename = save_path(level_name)
	if ResourceLoader.exists(filename):
		return ResourceLoader.load(filename, "", ResourceLoader.CACHE_MODE_IGNORE)
	return LevelRecord.new()

func save_level_record(level_name: String, level_record: LevelRecord):
	# TODO: update instead of overwrite ?	
	var existing = get_level_record(level_name)

	level_record.task0 = level_record.task0 || existing.task0
	level_record.task1 = level_record.task1 || existing.task1
	level_record.task2 = level_record.task2 || existing.task2
	level_record.best_time = min(level_record.best_time, existing.best_time)

	var filename = save_path(level_name)
	var result = ResourceSaver.save(level_record, filename)
	print_debug("save result: " + str(result))
