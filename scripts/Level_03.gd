extends Node2D

@onready var player: Player = $Player
@onready var ui = $UI
@onready var win_zone: Area2D = $WinZone

func _ready() -> void:
	GameManager.current_level = 3
	GameManager.respawn_position = player.position
	GameManager.reset()

	player.stamina_changed.connect(ui.update_stamina)
	player.died.connect(_on_player_died)
	GameManager.lives_changed.connect(ui.update_lives)

	win_zone.body_entered.connect(_on_win_entered)

	ui.update_stamina(3)
	ui.update_lives(GameManager.lives)

	AudioManager.play_music(3)

func _on_player_died() -> void:
	GameManager.lose_life()
	if GameManager.lives > 0:
		player.respawn(GameManager.respawn_position)

func _on_win_entered(body: Node2D) -> void:
	if body is Player:
		AudioManager.play_sfx("win")
		ui.trigger_win()
