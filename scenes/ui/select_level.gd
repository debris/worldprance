extends Node2D

const LEVELS_PATH = "res://resources/levels"

@onready var levels_grid = $GridContainer/GridContainer/ScrollContainer/LevelsGrid
#@onready var right_panel = $GridContainer/GridContainer/RightPanel
@onready var right_panel = $RightPanel

func get_levels() -> Array:
	var result = []

	var dir = DirAccess.open(LEVELS_PATH)
	if dir:
		dir.list_dir_begin()
		var filename = dir.get_next()
		while filename != "":
			var level = LEVELS_PATH + "/" + filename
			var level_data = load(level)
			result.push_back(level_data)
			filename = dir.get_next()
			
	result.sort_custom(func(a, b):
		return a.order_id < b.order_id	
	)

	return result

func _ready():
	for level_data in get_levels():
		print(level_data.level_name)
		var cell = preload("res://scenes/ui/select_level_cell.tscn").instantiate()
		cell.level_data = level_data
		cell.cell_selected.connect(cell_selected)
		levels_grid.add_child(cell)

func cell_selected(level_data: LevelData):
	right_panel.level_data = level_data
