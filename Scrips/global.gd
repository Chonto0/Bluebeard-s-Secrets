extends Node

var current_scene = "MansionP1"
var transition_scene = false
var player_exit_cliffside_posx = 0
var player_exit_cliffside_posy = 0
var player_start_posx = 0
var player_start_posy = 0

func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "MansionP1":
			current_scene = "FinalJuego"
		else:
			current_scene = "MansionP1"
