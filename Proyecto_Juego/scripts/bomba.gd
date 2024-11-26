extends CharacterBody2D
@onready var anim_player1 = $AnimatedSprite2D
var speed : float = 75 # Velocidad de movimiento del enemigo

var player = null

func _ready():
	player = get_tree().get_nodes_in_group("personaje")[0]
	anim_player1.play("idle")
func _process(delta: float) -> void:
	follow()

func follow():
	if player != null:
		velocity=position.direction_to(player.position) * speed
		move_and_slide()
		
func destroid():
	pass
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name==("personaje"):
		anim_player1.play("explo")
		await anim_player1.animation_finished  # Espera hasta que termine la animación.
		queue_free()  

		 # Replace with function body.
