extends CharacterBody2D

# Velocidad de movimiento del personaje
@export var speed := 200
@onready var anim_player1 = $Corazon1/AnimatedSprite2D
@onready var anim_player2 = $Corazon2/AnimatedSprite2D
@onready var anim_player3 = $Corazon3/AnimatedSprite2D
@onready var globos_label = $GlobosLabel  # Aquí obtenemos la referencia al Label para los globos

var salud = 6
var count_globos = 0
var attack_direction = Vector2.DOWN  
@export var attack_scene : PackedScene


func _process(delta):
	var movement := Vector2.ZERO  # Vector para almacenar la dirección de movimiento

	# Captura de teclas de movimiento
	if Input.is_action_pressed("ui_right"):
		movement.x += 1
		$AnimatedSprite2D.play("right")
		attack_direction = Vector2.RIGHT  # Dirección hacia la derecha

	elif Input.is_action_pressed("ui_left"):
		movement.x -= 1
		$AnimatedSprite2D.play("left")
		attack_direction = Vector2.LEFT  # Dirección hacia la IZQ

	elif Input.is_action_pressed("ui_down"):
		movement.y += 1
		$AnimatedSprite2D.play("down")
		attack_direction = Vector2.DOWN  # Dirección hacia abajo

	elif Input.is_action_pressed("ui_up"):
		movement.y -= 1
		$AnimatedSprite2D.play("up")
		attack_direction = Vector2.UP  # Dirección hacia arriba

	else:
		$AnimatedSprite2D.play("idle")
		velocity.x = 0

	# Normaliza el vector de movimiento para evitar que el personaje se mueva más rápido en diagonal
	movement = movement.normalized() * speed

	# Mueve al personaje
	velocity = movement
	move_and_slide()
	
	if Input.is_action_just_pressed("ui_accept"):
		lanzar_ataque()  # Lanza el proyectil cuando se presiona la tecla

func _ready() -> void:
	# Verificar si los nodos AnimatedSprite están correctamente asignados
	if anim_player1 and anim_player2 and anim_player3:
		# Imprimir las referencias para verificar
		print("Animaciones referenciadas correctamente:")
		print(anim_player1)
		print(anim_player2)
		print(anim_player3)
		
		# Reproducir la animación "lleno" en los tres AnimatedSprites
		anim_player1.play("lleno")
		anim_player2.play("lleno")
		anim_player3.play("lleno")
	else:
		print("Uno o más nodos AnimatedSprite no están correctamente asignados.")

func _on_attack_input():
	if Input.is_action_just_pressed("ui_accept"):  # Suponiendo que "ui_accept" está mapeado a la tecla "Z"
		lanzar_ataque()

func lanzar_ataque():
	var proyectil = attack_scene.instantiate()  # Instancia el proyectil
	proyectil.position = position  # Coloca el proyectil en la posición del personaje
	proyectil.direction = attack_direction  # Asigna la dirección del proyectil
	get_tree().current_scene.add_child(proyectil)  # Agrega el proyectil a la escena
	
func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("abeja"):
		print("Abeja hizo daño")
		salud -= 1
		if salud == 5:
			anim_player1.play("lleno")
			anim_player2.play("lleno")
			anim_player3.play("medio")
		if salud == 4:
			anim_player1.play("lleno")
			anim_player2.play("lleno")
			anim_player3.play("vacio")
		if salud == 3:
			anim_player1.play("lleno")
			anim_player2.play("medio")
			anim_player3.play("vacio")
		if salud == 2:
			anim_player1.play("lleno")
			anim_player2.play("vacio")
			anim_player3.play("vacio")	
		if salud == 1:
			anim_player1.play("medio")
			anim_player2.play("vacio")
			anim_player3.play("vacio")
		if salud == 0:
			anim_player1.play("vacio")
			anim_player2.play("vacio")
			anim_player3.play("vacio")
			print ("Personaje murió")
			get_tree().change_scene_to_file("res://escenas/muerte.tscn")

			
	if body.is_in_group("globo_salud"):		
		print("Globo curación")
		salud += 1
		if salud == 6:
			anim_player1.play("lleno")
			anim_player2.play("lleno")
			anim_player3.play("lleno")
		elif salud == 5:
			anim_player1.play("lleno")
			anim_player2.play("lleno")
			anim_player3.play("medio")
		elif salud == 4:
			anim_player1.play("lleno")
			anim_player2.play("lleno")
			anim_player3.play("vacio")
		elif salud == 3:
			anim_player1.play("lleno")
			anim_player2.play("medio")
			anim_player3.play("vacio")
		elif salud == 2:
			anim_player1.play("lleno")
			anim_player2.play("vacio")
			anim_player3.play("vacio")	
		
	if body.is_in_group("balon"):
		print("Balón hizo daño")
		salud -= 1
		if salud == 5:
			anim_player1.play("lleno")
			anim_player2.play("lleno")
			anim_player3.play("medio")
		elif salud == 4:
			anim_player1.play("lleno")
			anim_player2.play("lleno")
			anim_player3.play("vacio")
		elif salud == 3:
			anim_player1.play("lleno")
			anim_player2.play("medio")
			anim_player3.play("vacio")
		elif salud == 2:
			anim_player1.play("lleno")
			anim_player2.play("vacio")
			anim_player3.play("vacio")	
		elif salud == 1:
			anim_player1.play("medio")
			anim_player2.play("vacio")
			anim_player3.play("vacio")
		elif salud == 0:
			anim_player1.play("vacio")
			anim_player2.play("vacio")
			anim_player3.play("vacio")
			print ("Personaje murió")
			get_tree().change_scene_to_file("res://escenas/muerte.tscn")
			
	if body.is_in_group("globo_salud_max"):
			anim_player1.play("lleno")
			anim_player2.play("lleno")
			anim_player3.play("lleno")

	if body.is_in_group("globos"):
		Global.count_globos += 1  # Usamos el contador global
		print("Contador Globos: " + str(Global.count_globos))
		globos_label.text = str(Global.count_globos) 
		
	if body.is_in_group("bomba"):
		print("Bomba hizo daño")
		salud -= 2
		if salud == 5:
			anim_player1.play("lleno")
			anim_player2.play("lleno")
			anim_player3.play("medio")
		if salud == 4:
			anim_player1.play("lleno")
			anim_player2.play("lleno")
			anim_player3.play("vacio")
		if salud == 3:
			anim_player1.play("lleno")
			anim_player2.play("medio")
			anim_player3.play("vacio")
		if salud == 2:
			anim_player1.play("lleno")
			anim_player2.play("vacio")
			anim_player3.play("vacio")	
		if salud == 1:
			anim_player1.play("medio")
			anim_player2.play("vacio")
			anim_player3.play("vacio")
		if salud == 0:
			anim_player1.play("vacio")
			anim_player2.play("vacio")
			anim_player3.play("vacio")
			print ("Personaje murió")
			get_tree().change_scene_to_file("res://escenas/muerte.tscn") # Mostrar el contador en el Label
