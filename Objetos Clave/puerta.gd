# Puerta.gd
extends StaticBody2D

func _ready():
	$abrir.visible = false
	$cerrar.visible = true

# Método que se conecta a la señal "puerta_abierta" emitida por la llave
func _on_llave_puerta_abierta():
	$abrir.visible = true
	queue_free()
	print("La puerta ha sido abierta")
