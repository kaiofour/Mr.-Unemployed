extends Node

signal lives_changed(current: int)
signal game_over

const LIVES_MAX := 3

var lives := LIVES_MAX
var respawn_position := Vector2.ZERO

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
