extends StaticBody2D

func _ready():
	$abrirsalida.visible = false
	$cerrarsalida.visible = true

func _on_salida_puerta_abierta() -> void:
	$abrirsalida.visible = true
	queue_free()
	print("La puerta ha sido abierta")
