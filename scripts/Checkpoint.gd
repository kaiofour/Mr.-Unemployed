extends Area2D

signal activated

var is_active := false

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is Player and not is_active:
		is_active = true
		GameManager.set_respawn(global_position)
		$Flag.modulate = Color(1.0, 0.85, 0.0)
		AudioManager.play_sfx("checkpoint")
		emit_signal("activated")
