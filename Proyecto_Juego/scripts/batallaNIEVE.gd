# BattleManager.gd
extends Node

@export var player_pokemon_data: PokemonData
@export var enemy_pokemon_data: PokemonData

# Turno actual: 1 = Jugador, -1 = Enemigo
var current_turn: int = 1

# Estados de la batalla
enum BattleState { PLAYER_TURN, ENEMY_TURN, END }
var battle_state: BattleState = BattleState.PLAYER_TURN

# Inicializa la batalla
func start_battle():
	# Inicializa el HP y otras variables necesarias
	player_pokemon_data.hp = player_pokemon_data.hp
	enemy_pokemon_data.hp = enemy_pokemon_data.hp
	battle_state = BattleState.PLAYER_TURN
	display_ui_options()  # Muestra las opciones de ataque en el UI

# Método llamado cuando el jugador elige un movimiento
func player_attack(move: Move):
	if battle_state != BattleState.PLAYER_TURN:
		return
	
	var damage = move.calculate_move_damage(player_pokemon_data.attack, enemy_pokemon_data.defense)
	enemy_pokemon_data.hp -= damage
	display_damage("enemy", damage)  # Muestra el daño en la interfaz
	
	if enemy_pokemon_data.hp <= 0:
		end_battle("Player")
	else:
		battle_state = BattleState.ENEMY_TURN
		enemy_attack()

# Método para el ataque del enemigo
func enemy_attack():
	var move = get_random_move(enemy_pokemon_data)  # Selecciona un movimiento al azar
	var damage = move.calculate_move_damage(enemy_pokemon_data.attack, player_pokemon_data.defense)
	player_pokemon_data.hp -= damage
	display_damage("player", damage)  # Muestra el daño en la interfaz

	if player_pokemon_data.hp <= 0:
		end_battle("Enemy")
	else:
		battle_state = BattleState.PLAYER_TURN
		display_ui_options()

# Finaliza la batalla
func end_battle(winner: String):
	battle_state = BattleState.END
	print(winner + " ha ganado la batalla.")
	# Aquí podrías mostrar una pantalla de victoria o derrota

# Muestra las opciones de ataque en la interfaz
func display_ui_options():
	# Muestra las opciones de ataque en la interfaz, como botones de ataque.
	pass

# Muestra el daño infligido en la interfaz
func display_damage(target: String, damage: int):
	# Actualiza la interfaz para mostrar el daño al objetivo especificado
	pass

# Obtiene un movimiento al azar del enemigo
func get_random_move(pokemon: PokemonData) -> Move:
	if pokemon.moves.size() == 0:
		return null
	var random_index = randi() % pokemon.moves.size()
	return pokemon.move[random_index]
