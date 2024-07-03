extends Area2D

@export var check_record: CheckRecord

func _ready():
	body_entered.connect(func(_body):
		var record = check_record.check_record()
		State.finish(record)
	)
