extends StaticBody2D

func _ready():
	$abrirultima.visible = false
	$cerrarultima.visible = true

func _on_llaveultima_puerta_abierta() -> void:
	$abrirultima.visible = true
	queue_free()
	print("La puerta ha sido abierta")
