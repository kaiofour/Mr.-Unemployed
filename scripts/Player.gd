class_name Player
extends CharacterBody2D

signal stamina_changed(current: int)
signal died

const SPEED := 200.0
const JUMP_VELOCITY := -500.0
const DASH_SPEED := 550.0
const DASH_DURATION := 0.15
const STAMINA_MAX := 3
const STAMINA_REGEN_DELAY := 2.0

var stamina := STAMINA_MAX
var is_dashing := false
var dash_timer := 0.0
var dash_dir := 1.0
var stamina_regen_timer := 0.0
var facing_dir := 1.0
var is_dead := false

func _physics_process(delta: float) -> void:
	if is_dead:
		return

	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	_process_dash(delta)
	_process_stamina_regen(delta)

	if not is_dashing:
		_process_movement()

	move_and_slide()

	if position.y > 1100.0:
		_die()

func _process_movement() -> void:
	var dir := Input.get_axis("move_left", "move_right")
	if dir != 0.0:
		facing_dir = sign(dir)
		velocity.x = dir * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0.0, SPEED)

func _process_dash(delta: float) -> void:
	if Input.is_action_just_pressed("dash") and stamina > 0 and not is_dashing:
		is_dashing = true
		dash_timer = DASH_DURATION
		stamina -= 1
		stamina_regen_timer = 0.0
		emit_signal("stamina_changed", stamina)
		dash_dir = facing_dir

	if is_dashing:
		dash_timer -= delta
		velocity.x = DASH_SPEED * dash_dir
		if dash_timer <= 0.0:
			is_dashing = false

func _process_stamina_regen(delta: float) -> void:
	if stamina >= STAMINA_MAX:
		return
	stamina_regen_timer += delta
	if stamina_regen_timer >= STAMINA_REGEN_DELAY:
		stamina_regen_timer = 0.0
		stamina = mini(stamina + 1, STAMINA_MAX)
		emit_signal("stamina_changed", stamina)

func _die() -> void:
	is_dead = true
	emit_signal("died")

func respawn(pos: Vector2) -> void:
	is_dead = false
	position = pos
	velocity = Vector2.ZERO
	stamina = STAMINA_MAX
	emit_signal("stamina_changed", stamina)

func take_hit() -> void:
	_die()
