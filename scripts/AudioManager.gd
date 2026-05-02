extends Node

@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var sfx_player: AudioStreamPlayer = $SFXPlayer

const MUSIC := {
	1: "res://assets/audio/music/level1.ogg",
	2: "res://assets/audio/music/level2.ogg",
	3: "res://assets/audio/music/level3.ogg",
}

const SFX := {
	"jump":      "res://assets/audio/sfx/jump.ogg",
	"dash":      "res://assets/audio/sfx/dash.ogg",
	"hit":       "res://assets/audio/sfx/hit.ogg",
	"checkpoint":"res://assets/audio/sfx/checkpoint.ogg",
	"game_over": "res://assets/audio/sfx/game_over.ogg",
	"win":       "res://assets/audio/sfx/win.ogg",
}

func play_music(level: int) -> void:
	var path: String = MUSIC.get(level, "")
	if path.is_empty() or not ResourceLoader.exists(path):
		return
	music_player.stream = load(path)
	music_player.play()

func stop_music() -> void:
	music_player.stop()

func play_sfx(sfx_name: String) -> void:
	var path: String = SFX.get(sfx_name, "")
	if path.is_empty() or not ResourceLoader.exists(path):
		return
	sfx_player.stream = load(path)
	sfx_player.play()
