# Puerta.gd
extends StaticBody2D

func _ready():
	$abrirbiblio.visible = false
	$cerrarbiblio.visible = true

func _on_llavebiblio_puerta_abierta() -> void:
	$abrirbiblio.visible = true
	queue_free()
	print("La puerta ha sido abierta")
