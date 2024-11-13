extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_planta_pressed() -> void:
	print("Elegir Tipo Planta")
	get_tree().change_scene_to_file("res://escenas/casa.tscn")

func _on_button_fuego_pressed() -> void:
	print("Elegir Tipo Fuego")
	get_tree().change_scene_to_file("res://escenas/casa.tscn")
	
func _on_button_agua_pressed() -> void:
	print("Elegir Tipo Agua")
	get_tree().change_scene_to_file("res://escenas/casa.tscn")
