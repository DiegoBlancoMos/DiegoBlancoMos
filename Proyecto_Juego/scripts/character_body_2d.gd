extends CharacterBody2D

# Velocidad de movimiento del personaje
@export var speed := 200

func _process(delta):
	var movement := Vector2.ZERO  # Vector para almacenar la dirección de movimiento

	# Captura de teclas de movimiento
	if Input.is_action_pressed("ui_right"):
		movement.x += 1
		$AnimatedSprite2D.play("right")
	elif Input.is_action_pressed("ui_left"):
		movement.x -= 1
		$AnimatedSprite2D.play("left")
	elif Input.is_action_pressed("ui_down"):
		movement.y += 1
		$AnimatedSprite2D.play("down")
	elif Input.is_action_pressed("ui_up"):
		movement.y -= 1
		$AnimatedSprite2D.play("up")
	else:
		$AnimatedSprite2D.play("idle")
		velocity.x = 0

	# Normaliza el vector de movimiento para evitar que el personaje se mueva más rápido en diagonal
	movement = movement.normalized() * speed

	# Mueve al personaje
	velocity = movement
	move_and_slide()
