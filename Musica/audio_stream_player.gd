extends AudioStreamPlayer

@onready var player = self  # Referencia al propio nodo.

func _ready() -> void:
	# Reproduce el audio asociado al nodo.
	player.play()
