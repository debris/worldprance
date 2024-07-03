extends CheckRecord
class_name CheckRecordPrison0

func check_record() -> LevelRecord:
	var level_record = LevelRecord.new()
	level_record.task0 = true
	level_record.task1 = State.time < 30.0 && State.get_collectible_count("cash") >= 3
	level_record.task2 = State.time < 15.0
	level_record.best_time = State.time
	return level_record
