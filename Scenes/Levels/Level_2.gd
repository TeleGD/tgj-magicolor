extends Node2D


var selected_color = "red"

# Initial state of the grid
var init_grid = [
	[ "blue", "blue",   null,   null ],
	[ "blue", "blue",   null,   null ],
	[ "blue", "blue", "blue",   null ],
	[ "blue", "blue", "blue", "blue" ],
	[ "blue", "blue", "blue", "blue" ],
	[ "blue", "blue", "blue", "blue" ],
	[ "blue", "blue", "blue", "blue" ]
]


func _ready():
	var tiles_grid_scene = load("res://Scenes/Tiles_Grid.tscn")
	var tiles_grid = tiles_grid_scene.instantiate()
	var window_width = get_viewport().size.x
	var window_height = get_viewport().size.y
	tiles_grid.init(self, init_grid, window_width, window_height)
	$Position_For_Tiles_Grid.add_child(tiles_grid)


func _process(delta):
	pass

func change_selected_color():
	pass

func get_selected_color():
	return selected_color

func next_level():
	get_tree().change_scene("res://Scenes/Levels/Level_3.tscn")
