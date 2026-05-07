extends Sprite2D

func _process(_delta: float) -> void:
	var pulse := sin(Time.get_ticks_msec() / 500.0) * 0.1
	scale = Vector2(2.0 + pulse, 2.0 + pulse)
