extends CharacterBody2D

@export var patrol_range := 100.0
@export var speed := 80.0

var start_x := 0.0
var direction := 1.0

func _ready() -> void:
	start_x = global_position.x
	$Hitbox.body_entered.connect(_on_hitbox_body_entered)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = speed * direction
	move_and_slide()
	var dist := global_position.x - start_x
	if abs(dist) >= patrol_range:
		direction *= -1.0
		global_position.x = start_x + clampf(dist, -patrol_range, patrol_range)

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player:
		body.take_hit()
