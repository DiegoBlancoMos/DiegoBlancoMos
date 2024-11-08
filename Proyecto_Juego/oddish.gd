extends CharacterBody2D

@export var speed: float = 50.0  # Velocidad de movimiento en píxeles por segundo
@export var left_limit: float = -100.0  # Límite izquierdo en la posición X
@export var right_limit: float = 100.0  # Límite derecho en la posición X

# Referencia al nodo AnimationPlayer para la animación de Idle
@onready var animation_player = $AnimatedSprite2D

var direction: int = 1  # Dirección inicial (1 = derecha, -1 = izquierda)

func _ready():
	# Reproducir la animación de Idle al inicio
	animation_player.play("idle")

func _physics_process(delta):
	# Movimiento continuo en la dirección actual
	position.x += speed * direction * delta

	# Cambiar de dirección al alcanzar los límites
	if position.x >= right_limit:
		direction = -1  # Cambia a izquierda
		animation_player.play("left")
	elif position.x <= left_limit:
		direction = 1 
		animation_player.play("right")
  # Cambia a derecha
