extends Node2D


var pokemon_stats = {
	"planta1": {"nombre": "Foliumar", "hp": 45, "ataque": 49, "defensa": 49, "velocidad": 45},
	"fuego1": {"nombre": "Flamingus", "hp": 39, "ataque": 52, "defensa": 43, "velocidad": 65},
	"agua1": {"nombre": "Aqualis", "hp": 44, "ataque": 48, "defensa": 65, "velocidad": 43}
}

# Variable para almacenar las estadísticas del Pokémon seleccionado
var selected_pokemon_stats = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_planta_pressed() -> void:
	print("Elegir Tipo Planta")
	select_pokemon("planta1")
	get_tree().change_scene_to_file("res://escenas/casa.tscn")

func _on_button_fuego_pressed() -> void:
	print("Elegir Tipo Fuego")
	select_pokemon("fuego1")
	get_tree().change_scene_to_file("res://escenas/casa.tscn")
	
func _on_button_agua_pressed() -> void:
	print("Elegir Tipo Agua")
	select_pokemon("agua1")
	get_tree().change_scene_to_file("res://escenas/casa.tscn")
	
func select_pokemon(tipo: String) -> void:
	selected_pokemon_stats = pokemon_stats[tipo]
	print("Estadísticas seleccionadas: ", selected_pokemon_stats)
