extends CharacterBody2D

var speed : float = 75 # Velocidad de movimiento del enemigo

var player = null

func _ready():
	player = get_tree().get_nodes_in_group("personaje")[0]
	
func _process(delta: float) -> void:
	follow()

func follow():
	if player != null:
		velocity=position.direction_to(player.position) * speed
		move_and_slide()
		
func destroid():
	pass
	
