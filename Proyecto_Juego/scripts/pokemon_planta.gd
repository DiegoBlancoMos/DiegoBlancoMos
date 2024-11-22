extends CharacterBody2D

# Referencia al AnimationPlayer para controlar las animaciones
@onready var anim_player = $AnimatedSprite2D

func _ready():
	anim_player.play("idle")
