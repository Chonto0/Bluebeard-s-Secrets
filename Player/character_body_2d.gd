# Jugador.gd
extends CharacterBody2D

var enemy_inattack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true
var enemy: Node2D = null  # Variable para guardar referencia al enemigo

var velocidad = 120.0
var direccion_horizontal = 0.0
var direccion_vertical = 0.0

@onready var anim := $AnimatedSprite2D
@onready var sprite := $Sprite2D
@onready var death_timer := $Timer

func _ready():
	if death_timer == null:
		death_timer = Timer.new()
		add_child(death_timer)
	death_timer.connect("timeout", Callable(self, "_on_death_animation_complete"))

func _physics_process(delta):
	if player_alive:
		player_movement(delta)
		enemy_attack()

	if health <= 0 and player_alive:
		_player_death()

func player_movement(delta):
	direccion_horizontal = Input.get_axis("ui_left", "ui_right")
	direccion_vertical = Input.get_axis("ui_up", "ui_down")
	
	velocity.x = direccion_horizontal * velocidad
	velocity.y = direccion_vertical * velocidad

	if direccion_horizontal != 0 or direccion_vertical != 0:
		anim.play("Caminar")
	else:
		anim.play("Parado")
	
	if direccion_horizontal > 0:
		$AnimatedSprite2D.flip_h = true
	elif direccion_horizontal < 0:
		$AnimatedSprite2D.flip_h = false

func _player_death():
	player_alive = false
	velocity = Vector2(0, 0)  # Detenemos el movimiento
	anim.play("Parado")  # Reproducir la animación de muerte
	death_timer.start(1.3)  # Ajustar la duración al tiempo que dure la animación
	if enemy:  # Si hay un enemigo asignado, detenerlo
		enemy.stop_enemy()

func _on_death_animation_complete():
	self.queue_free()  # Eliminar el jugador después de la animación

func player():
	pass

func _on_area_2d_body_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true
		enemy = body  # Guarda la referencia al enemigo
		
func _on_area_2d_body_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false
		enemy = null  # Limpia la referencia si sale del rango

func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown == true:
		health -= 20
		enemy_attack_cooldown = false
		$AttackCooldown.start()
		print(health)

func _on_timer_timeout():
	enemy_attack_cooldown = true
