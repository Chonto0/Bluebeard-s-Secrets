extends StaticBody2D

signal puerta_abierta

@onready var interaction_area: InteractionArea = $InteractionArea

var llavetomada = false
var en_zona_puerta = false


func _ready():
	interaction_area.interact = Callable(self, "_on_interact")  # Establece la acción de interacción


# Función de interacción para cuando el jugador toma la llave
func _on_interact():
	if llavetomada == false:
		llavetomada = true
		interaction_area.queue_free()
		$Sprite2D.queue_free()
	
func _process(delta):
	if llavetomada == true and en_zona_puerta == true:
		if Input.is_action_just_pressed("interact"):
			print("puerta_abierta")
			emit_signal("puerta_abierta")  # Emite la señal cuando se p



# Detecta cuando el jugador entra en la zona de la puerta
func _on_puerta_zona_body_entered(body: Node2D) -> void:
	if body.is_in_group("JugadorM"):
		en_zona_puerta = true
		print("En zona puerta: ", en_zona_puerta)


# Detecta cuando el jugador sale de la zona de la puerta
func _on_puerta_zona_body_exited(body: Node2D) -> void:
	if body.is_in_group("JugadorM"):
		en_zona_puerta = false
		print("En zona puerta: ", en_zona_puerta)
