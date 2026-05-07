extends Area2D

signal activated

var is_active := false

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _process(_delta: float) -> void:
	var pulse := sin(Time.get_ticks_msec() / 600.0) * 0.12
	$Flag.scale = Vector2(2.0 + pulse, 2.0 + pulse)
	$Highlight.modulate.a = 0.6 + sin(Time.get_ticks_msec() / 400.0) * 0.4

func _on_body_entered(body: Node2D) -> void:
	if body is Player and not is_active:
		is_active = true
		GameManager.set_respawn(global_position)
		$Flag.texture = load("res://assets/sprites/checkpoint_active.png")
		$Highlight.color = Color(1, 0.85, 0.0, 0.5)
		AudioManager.play_sfx("checkpoint")
		emit_signal("activated")
