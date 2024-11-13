extends CharacterBody2D

# Referencia al AnimationPlayer para controlar las animaciones
@onready var anim_player = $AnimatedSprite2D2

func _ready():
	# Reproducir la animación "Idle" cuando el NPC está listo
	anim_player.play("idle")
