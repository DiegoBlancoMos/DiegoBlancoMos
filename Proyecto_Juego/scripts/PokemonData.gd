# PokemonData.gd
extends Resource  # O Class para hacerlo más flexible.

class_name PokemonData  # Define la clase como un recurso que puede guardarse y cargar.

@export var name: String
@export var hp: int
@export var attack: int
@export var defense: int
@export var moves: Array[String]  # Nombres de los movimientos disponibles
@export var level: int = 1

# Métodos para calcular daño y otros efectos se pueden definir aquí
func calculate_damage(opponent_defense: int) -> int:
	# Fórmula simplificada de daño
	var damage = (attack - opponent_defense / 2)
	return max(damage, 1)  # Asegúrate de que siempre haya al menos 1 de daño
