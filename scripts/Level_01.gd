extends Node2D

@onready var player: Player = $Player
@onready var hud: HUD = $HUD

func _ready() -> void:
	GameManager.respawn_position = player.position
	GameManager.reset()

	player.stamina_changed.connect(hud.update_stamina)
	player.died.connect(_on_player_died)
	GameManager.lives_changed.connect(hud.update_lives)
	GameManager.game_over.connect(_on_game_over)

	hud.update_stamina(3)
	hud.update_lives(GameManager.lives)

func _on_player_died() -> void:
	GameManager.lose_life()
	if GameManager.lives > 0:
		player.respawn(GameManager.respawn_position)

func _on_game_over() -> void:
	get_tree().reload_current_scene()
