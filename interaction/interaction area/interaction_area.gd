extends Area2D
class_name InteractionArea

@export var action_name: String = "AGARRAR LA LLAVE"

var interact: Callable = func():
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("JugadorM"):
		InteractionManager.register_area(self)  # Registra el área de interacción

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("JugadorM"):
		InteractionManager.unregister_area(self)  # Desregistra el área de interacción
