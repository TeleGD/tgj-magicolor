extends Node2D


var next_level = "Level_3"
var selected_color = "blue"
var tiles_grid = null
var grid_x = 17


# Initial state of the grid
var init_grid = [
	[  null,     null, "yellow",   "blue",     null,   null ],
	[  null,   "blue",   "blue",   "blue",   "blue",   null ],
	["blue", "yellow", "yellow", "yellow", "yellow", "blue" ],
	["blue",   "blue",   "blue",   "blue",   "blue", "blue" ]
]


func _ready():
	update_pinceau(selected_color)

func validate_grid():
	var tiles_grid = $Level.get_tiles_grid()
	var colors_grid = tiles_grid.get_colors_grid()
	var count_yellow = 0
	var nb_rows = len(colors_grid)
	var nb_columns = len(colors_grid[0])
	for i_y in range(nb_rows): 
		for i_x in range(nb_columns):
			if colors_grid[i_y][i_x] == "yellow":
				count_yellow += 1
	return count_yellow == 0

func get_init_grid():
	return init_grid

func get_grid_x():
	return grid_x

func get_selected_color():
	return selected_color

func load_next_level():
	get_tree().change_scene_to_file("res://Scenes/Levels/"+next_level+".tscn")

func _on_pot_couleur_choisie(pot_color):
	selected_color = pot_color
	update_pinceau(pot_color)

func update_pinceau(color):
	match color:
		"red":
			Input.set_custom_mouse_cursor(load("res://Images/Pinceaux/pinceau_rouge.png"))
		"blue":
			Input.set_custom_mouse_cursor(load("res://Images/Pinceaux/pinceau_bleu.png"))
		"yellow":
			Input.set_custom_mouse_cursor(load("res://Images/Pinceaux/pinceau_jaune.png"))

