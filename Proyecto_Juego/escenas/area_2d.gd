extends Area2D

# Referencias a los nodos AnimatedSprite dentro de los StaticBody2D
var count_globos = 0

# Called when the node enters the scene tree for the first time.
# Cuando el área de colisión entra en contacto con otro cuerpo
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("globos"):
		count_globos += 1
		print ("Contador Globos: "+ str(count_globos))		
		
		# Aquí puedes reducir la salud o realizar otras acciones
