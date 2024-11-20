extends Node2D

var change_scene = preload("res://Player/final_juego.tscn")

# Evento que ocurre cuando un cuerpo entra en la colisión del nodo.
func _on_fin_juego_body_entered(body: Node2D) -> void:
	if body.has_method("JugadorM"):
		get_tree().change_scene_to_packed(change_scene)
		pass
		
