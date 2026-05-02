extends AnimatableBody2D

@export var move_distance := 150.0
@export var speed := 80.0

var start_x := 0.0
var direction := 1.0

func _ready() -> void:
	start_x = global_position.x

func _physics_process(delta: float) -> void:
	var step := speed * direction * delta
	var next_x := global_position.x + step
	if abs(next_x - start_x) >= move_distance:
		direction *= -1.0
		step = speed * direction * delta
	global_position.x += step
