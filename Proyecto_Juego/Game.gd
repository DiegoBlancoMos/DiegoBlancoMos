extends Node



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var pokemon_stats = {
	"planta": {"nombre": "Foliumar", "hp": 45, "ataque": 49, "defensa": 49, "velocidad": 45},
	"fuego": {"nombre": "Flamingus", "hp": 39, "ataque": 52, "defensa": 43, "velocidad": 65},
	"agua": {"nombre": "Aqualis", "hp": 44, "ataque": 48, "defensa": 65, "velocidad": 43}
}

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
