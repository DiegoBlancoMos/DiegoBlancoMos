extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	send_post_new_score()
	send_get_request()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_volverjugar_pressed() -> void:
	Global.count_globos = 0
	Global.enemigo = 0
	get_tree().change_scene_to_file("res://escenas/casa.tscn")


func _on_salir_pressed() -> void:
	get_tree().quit()
	
func send_post_new_score():
	var http_request = HTTPRequest.new()
	add_child(http_request)
	var body = JSON.stringify({"username": "Personaje", "score": Global.count_globos})
	var headers = ["Content-Type: application/json", "Client-Secret: abc"] # CLIENT_SECRET should never be public! If leaked, ALL clients should be force-updated to use a new one
	http_request.request("http://127.0.0.1:8000/score", headers, HTTPClient.METHOD_POST, body)

func send_get_request():
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.connect("request_completed", _on_server_responded)
	var headers = ["Content-Type: application/json", "Client-Secret: abc"] # CLIENT_SECRET should never be public! If leaked, ALL clients should be force-updated to use a new one
	http_request.request("http://127.0.0.1:8000/score", headers, HTTPClient.METHOD_GET)

func _on_server_responded(result, response_code, headers, body):
	var response = JSON.parse_string(body.get_string_from_utf8())
	print("Server response:")
	print(response)
