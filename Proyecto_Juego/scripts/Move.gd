# Move.gd
extends Resource

class_name Move

@export var name: String
@export var power: int
@export var type: String  # Por ejemplo, "fuego", "agua", etc.

func calculate_move_damage(attacker_attack: int, opponent_defense: int) -> int:
	var base_damage = attacker_attack + power - opponent_defense
	return max(base_damage, 1)
