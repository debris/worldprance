extends Resource
class_name LevelRecord

@export var task0 := false
@export var task1 := false
@export var task2 := false
@export var cash: int = 0
@export var best_time := 1000.0

func completed() -> int:
	var total := 0
	if task0:
		total += 1
	if task1:
		total += 1
	if task2:
		total += 1
	return total
