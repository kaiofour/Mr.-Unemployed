extends StaticBody2D

@export var belt_speed := 200.0
@export var belt_direction := 1

func _ready() -> void:
	constant_linear_velocity = Vector2(belt_speed * float(belt_direction), 0.0)
