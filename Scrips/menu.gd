extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Player/controles.tscn")



func _on_salir_pressed():
	get_tree().quit()
