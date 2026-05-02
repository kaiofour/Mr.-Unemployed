extends Node

signal lives_changed(current: int)
signal game_over

const LIVES_MAX := 3

const LEVEL_PATHS := {
	1: "res://scenes/Level_01.tscn",
	2: "res://scenes/Level_02.tscn",
	3: "res://scenes/Level_03.tscn",
}

var lives := LIVES_MAX
var respawn_position := Vector2.ZERO
var current_level := 1

func reset() -> void:
	lives = LIVES_MAX
	emit_signal("lives_changed", lives)

func set_respawn(pos: Vector2) -> void:
	respawn_position = pos

func lose_life() -> void:
	lives -= 1
	emit_signal("lives_changed", lives)
	if lives <= 0:
		emit_signal("game_over")

func get_next_level_path() -> String:
	return LEVEL_PATHS.get(current_level + 1, "")

func advance_level() -> void:
	current_level += 1
