extends CharacterBody2D

var velocidad = 140.0
var jugador_chase = false
var jugador = null

@onready var anim := $AnimatedSprite2D

func _physics_process(delta):
	# Reiniciar la velocidad
	velocity = Vector2.ZERO

	if jugador_chase and jugador:
		# Calcular dirección hacia el jugador y establecer la velocidad
		velocity = (jugador.position - position).normalized() * velocidad
		
		# Solo reproducir la animación de caminar si el enemigo está en movimiento
		if velocity.length() > 0:
			anim.play("Caminar")

		# Flip de la animación según la posición del jugador
		anim.flip_h = (jugador.position.x - position.x) > 0
	else:
		# Solo reproducir la animación de "Parado" si el enemigo no se está moviendo
		anim.play("Parado")

	# Mover al enemigo teniendo en cuenta las colisiones
	move_and_slide()

func _on_detection_body_entered(body: Node2D) -> void:
	jugador = body
	jugador_chase = true

func _on_detection_body_exited(body: Node2D) -> void:
	jugador = null
	jugador_chase = false

func _on_enemy_hitbox_body_entered(body):
	jugador = body

func enemy():
	pass

func stop_enemy():
	jugador_chase = false
	velocity = Vector2.ZERO  # Asegúrate de detener el movimiento
	anim.play("Parado")  # Reproducir la animación de "Parado"
