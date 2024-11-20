extends CharacterBody2D

var idle = false
var walking = false

var xdir = 1 # 1 == right, -1 == left
var ydir = 1 # 1 == down, -1 == up
var speed = 10

var input = Vector2() #used to be movement
var moving_vertical_horizontal = 1 # 1==x 2 == y

func _ready():
	walking = true
	randomize()
	
func _physics_process(delta):
	var waittime = 1
	if walking == false:
		var x = randi_range(1,2)
		if x > 1.5:
			moving_vertical_horizontal = 1
		else:
			moving_vertical_horizontal = 2	
		
	if walking == true:
		$AnimatedSprite2D.play("Caminar")
		if moving_vertical_horizontal == 1:
			if xdir == -1:
				$AnimatedSprite2D.flip_h = false
				velocity.x = -speed
				velocity.y = 0
			if xdir == 1:
				$AnimatedSprite2D.flip_h = true
				velocity.x = speed
				velocity.y = 0
			
			
		elif moving_vertical_horizontal == 2:
			if ydir == -1:
				velocity.y = -speed
				velocity.x = 0
			if ydir == 1:
				velocity.y = speed
				velocity.x = 0
		
	if idle == true:
		$AnimatedSprite2D.play("Idle")
		velocity = Vector2.ZERO
		
	move_and_slide()


func _on_cambio_estado_timeout():
	var waittime = 1
	if walking == true:
		idle = true
		walking = false
		waittime = randi_range(1,5)
	
	elif idle == true:
		walking = true
		idle = false
		waittime = randi_range(2,6)
	$CambioEstado.wait_time = waittime
	$CambioEstado.start	
	



func _on_caminar_timeout() :
	var x = randi_range(1,2)
	var y = randi_range(1,2)
	var waittime = randi_range(1,4)
	
	if x > 1.5:
		xdir = 1 #right
	else:
		xdir = -1 #left
	if y > 1.5:
		ydir = 1
	else:
		ydir = -1
	$Caminar.wait_time = waittime
	$Caminar.start()
