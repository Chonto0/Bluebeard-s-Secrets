extends StaticBody2D

func _ready():
	$abrirprefin.visible = false
	$cerrarprefin.visible = true


func _on_llaveprefin_puerta_abierta() -> void:
	$abrirprefin.visible = true
	queue_free()
	print("La puerta ha sido abierta")
