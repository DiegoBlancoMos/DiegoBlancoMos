extends Node2D

@onready var enemy_scene = preload("res://escenas/balon.tscn")  # Ruta a la escena del enemigo
@onready var spawn_timer = $SpawnBalon  # Referencia al Timer
var positionX
var positionY
func _ready():
	# Asegúrate de que el timer comienza a contar automáticamente
	spawn_timer.start()
	send_get_request()

func send_get_request():
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.connect("request_completed", _on_server_responded)
	var headers = ["Content-Type: application/json", "Client-Secret: abc"] # CLIENT_SECRET should never be public! If leaked, ALL clients should be force-updated to use a new one
	http_request.request("http://127.0.0.1:8000/ball_spawn_pos", headers, HTTPClient.METHOD_GET)

func _on_server_responded(result, response_code, headers, body):
	var response = JSON.parse_string(body.get_string_from_utf8())
	print("Server response:")
	print(response)
	print(response.positionX)
	print(response.positionY)
	positionX = response.positionX
	positionY = response.positionY
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
	var spawn_position = Vector2(positionX, positionY)  # Ajusta las coordenadas de spawn como desees
	new_enemy.position = spawn_position

	# Agregar el enemigo a la escena
	add_child(new_enemy)

func _on_spawn_balon_timeout() -> void:
	spawn_enemy()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Personaje" and Global.count_globos >= 20:
		get_tree().change_scene_to_file("res://escenas/nivel2.tscn")

		
