extends CheckRecord
class_name CheckRecordBlockC

func check_record() -> LevelRecord:
	var level_record = LevelRecord.new()
	level_record.task0 = true
	level_record.task1 = State.get_collectible_count("card") > 0
	level_record.task2 = State.get_collectible_count("swap") == 0
	level_record.cash = State.get_collectible_count("cash")
	level_record.best_time = State.time
	return level_record
