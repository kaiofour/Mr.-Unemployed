extends CharacterBody2D

@export var speed := 120.0

var is_chasing := false
var player_ref: Player = null

func _ready() -> void:
	$DetectionZone.body_entered.connect(_on_detection_entered)
	$DetectionZone.body_exited.connect(_on_detection_exited)
	$Hitbox.body_entered.connect(_on_hitbox_body_entered)

func _physics_process(_delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * _delta
	if is_chasing and player_ref:
		velocity.x = sign(player_ref.global_position.x - global_position.x) * speed
	else:
		velocity.x = move_toward(velocity.x, 0.0, speed)
	move_and_slide()

func _on_detection_entered(body: Node2D) -> void:
	if body is Player:
		is_chasing = true
		player_ref = body

func _on_detection_exited(body: Node2D) -> void:
	if body is Player:
		is_chasing = false
		player_ref = null

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player:
		body.take_hit()
