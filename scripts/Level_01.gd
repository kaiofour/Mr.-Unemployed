extends Node2D

@onready var player: Player = $Player
@onready var ui = $UI # Changed to point to the new UI scene

func _ready() -> void:
	GameManager.respawn_position = player.position
	GameManager.reset()

	# Route signals to UI instead of HUD
	player.stamina_changed.connect(ui.update_stamina)
	player.died.connect(_on_player_died)
	GameManager.lives_changed.connect(ui.update_lives)
	
	# We REMOVED the GameManager.game_over.connect here. The UI script handles it now.

	ui.update_stamina(3)
	ui.update_lives(GameManager.lives)

func _on_player_died() -> void:
	GameManager.lose_life()
	if GameManager.lives > 0:
		player.respawn(GameManager.respawn_position)
