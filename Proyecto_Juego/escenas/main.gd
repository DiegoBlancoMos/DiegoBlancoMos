extends Node2D

@onready var enemy_scene = preload("res://escenas/abeja.tscn")  # Ruta a la escena del enemigo
@onready var spawn_timer = $SpawnAbejas  # Referencia al Timer

func _ready():
	# Asegúrate de que el timer comienza a contar automáticamente
	spawn_timer.start()

# Función llamada cada vez que el Timer se dispara
func _on_EnemySpawnTimer_timeout():
	spawn_enemy()

# Función para instanciar el enemigo
func spawn_enemy():
	# Instanciar un nuevo enemigo a partir de la escena pre-cargada
	var new_enemy = enemy_scene.instantiate()
	new_enemy.name = "abeja"  # Asignamos el nombre "abeja"
	new_enemy.add_to_group("abeja")  # Asegúrate de agregarla al grupo


	# Colocar el nuevo enemigo en una posición aleatoria (por ejemplo, en la parte superior de la pantalla)
	var spawn_position = Vector2(-169, -196)  # Ajusta las coordenadas de spawn como desees
	new_enemy.position = spawn_position

	# Agregar el enemigo a la escena
	add_child(new_enemy)

func _on_spawn_abejas_timeout() -> void:
	spawn_enemy()
