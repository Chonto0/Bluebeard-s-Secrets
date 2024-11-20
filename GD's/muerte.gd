extends Control

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Player/mansion_p_0.tscn")


func _on_salir_pressed() -> void:
	get_tree().quit()
