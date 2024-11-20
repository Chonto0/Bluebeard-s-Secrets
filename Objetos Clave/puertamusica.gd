extends StaticBody2D

func _ready():
	$abrirmusica.visible = false
	$cerrarmusica.visible = true


func _on_llavemusica_puerta_abierta() -> void:
	$abrirmusica.visible = true
	queue_free()
	print("La puerta ha sido abierta")
