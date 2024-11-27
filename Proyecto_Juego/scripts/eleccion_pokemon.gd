extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _on_button_fuego_pressed() -> void:
	print("Elegir Tipo Fuego")
	Global.attack = 1
	get_tree().change_scene_to_file("res://escenas/casa.tscn")
func _on_button_agua_2_pressed() -> void:
	print("Elegir Tipo Agua")
	Global.attack = 2
	get_tree().change_scene_to_file("res://escenas/casa.tscn")
func _on_button_energia_pressed() -> void:
	print("Elegir Tipo Energía")
	Global.attack = 0
	get_tree().change_scene_to_file("res://escenas/casa.tscn")
