extends Node2D

@onready var enemy_scene = preload("res://escenas/balon.tscn")  # Ruta a la escena del enemigo
@onready var spawn_timer = $SpawnBalon  # Referencia al Timer

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
	new_enemy.name = "balon"  # Asignamos el nombre "abeja"
	new_enemy.add_to_group("balon")  # Asegúrate de agregarla al grupo


	# Colocar el nuevo enemigo en una posición aleatoria (por ejemplo, en la parte superior de la pantalla)
	var spawn_position = Vector2(291, 0)  # Ajusta las coordenadas de spawn como desees
	new_enemy.position = spawn_position

	# Agregar el enemigo a la escena
	add_child(new_enemy)

func _on_spawn_balon_timeout() -> void:
	spawn_enemy()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Personaje" and Global.count_globos >= 20:
		get_tree().change_scene_to_file("res://escenas/nivel2.tscn")

		
