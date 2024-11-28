extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_play_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/casa.tscn")
	
func _on_button_quit_pressed() -> void:
	get_tree().quit()


func _on_button_instruciones_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/controles.tscn")


func _on_button_opciones_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/opciones.tscn")
 # Replace with function body.
