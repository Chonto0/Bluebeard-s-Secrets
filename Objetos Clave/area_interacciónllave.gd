extends Area2D

@export var descripcion_llave: String = "Es una llave antigua con grabados misteriosos."
var jugador_dentro = false

func _on_area_body_entered(body: Node2D) -> void:
	if body.name == "JugadorM":  # Verifica que el cuerpo es el jugador
		jugador_dentro = true
		mostrar_dialogo(descripcion_llave)

func _on_area_body_exited(body: Node2D) -> void:
	if body.name == "JugadorM":  # Verifica que el cuerpo es el jugador
		jugador_dentro = false
		ocultar_dialogo()

# Funciones para controlar el diálogo
func mostrar_dialogo(texto: String) -> void:
	var hud = get_tree().root.get_node("MainScene/HUD")
	hud.mostrar_mensaje(texto)

func ocultar_dialogo() -> void:
	var hud = get_tree().root.get_node("MainScene/HUD")
	hud.ocultar_mensaje()
