extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name =="JugadorM":
		get_tree().change_scene_to_file("res://Player/dialogos_finales.tscn")
		pass
