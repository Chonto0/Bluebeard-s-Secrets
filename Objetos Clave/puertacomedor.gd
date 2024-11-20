extends StaticBody2D

func _ready():
	$abrircomedor.visible = false
	$cerrarcomedor.visible = true


func _on_llavecomedor_puerta_abierta() -> void:
	$abrircomedor.visible = true
	queue_free()
	print("La puerta ha sido abierta")
