extends CharacterBody2D

# Referencia al AnimationPlayer para controlar las animaciones
@onready var anim_player = $AnimatedSprite2D
var explosion_played = false

func _ready():
	# Reproducir la animación "Idle" cuando el NPC está listo
	anim_player.play("idle")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Personaje" and not explosion_played:
		anim_player.play("explo")
		explosion_played = true
		await anim_player.animation_finished
		queue_free()
	
