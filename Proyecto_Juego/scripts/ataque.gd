extends Area2D

@export var speed : float = 400  # Velocidad del proyectil
var direction : Vector2  # Dirección hacia la que se mueve el proyectil
@onready var anim_player = $AnimatedSprite2D

# Cuando el proyectil entra en contacto con algo
  # Destruye el proyectil después de que hace contacto

func _ready():
	# Mueve el proyectil en la dirección dada
	set_collision_mask_value(0, true)
	if Global.attack==2:
		anim_player.play("attack2")
	if Global.attack==1:
		anim_player.play("attack1")  # Habilitar la máscara de colisión si es necesario
	if Global.attack==0:
		anim_player.play("attack")  # Habilitar la máscara de colisión si es necesario
  # Habilitar la máscara de colisión si es necesario

# Actualiza el movimiento del proyectil
func _process(delta: float) -> void:
	position += direction * speed * delta  # Mueve el proyectil en la dirección


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("abeja") or body.is_in_group("balon") or body.is_in_group("bomba"):  # Asegúrate de que las abejas estén en el grupo "abeja"
		body.queue_free()  # Eliminar la abeja
		queue_free()  # Eliminar el proyectil
