extends StaticBody2D

var en_zona = false  # Indica si el jugador está en la zona de interacción


func _on_muro_zona_body_entered(body: Node2D) -> void:
	if body.is_in_group("JugadorM"):  # Verifica que es el jugador
		en_zona = true
		print("Jugador en zona")

func _on_muro_zona_body_exited(body: Node2D) -> void:
	if body.is_in_group("JugadorM"):  # Verifica que es el jugador
		en_zona = false
		print("Jugador salió de la zona")

func _process(delta: float) -> void:
	if en_zona and Input.is_action_just_pressed("interact"):
		abrir_pared()

func abrir_pared() -> void:
	$abrirmuro.visible = true
	queue_free() 
	print("muro abierto")
