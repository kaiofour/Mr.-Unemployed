extends Node2D

@export var fall_delay := 2.0
@export var fall_speed := 400.0
@export var warning_time := 1.0

@onready var box: Area2D = $Box
@onready var shadow: Sprite2D = $Shadow
@onready var timer: Timer = $Timer

var start_y := 0.0
var is_falling := false
var has_hit := false
var warning_timer := 0.0
var showing_warning := false

func _ready() -> void:
	start_y = box.position.y
	timer.wait_time = fall_delay
	timer.timeout.connect(_start_warning)
	timer.start()
	box.body_entered.connect(_on_box_body_entered)
	shadow.modulate.a = 0.0

func _process(delta: float) -> void:
	if showing_warning:
		warning_timer -= delta
		shadow.modulate.a = lerpf(0.0, 0.7, 1.0 - (warning_timer / warning_time))
		if warning_timer <= 0.0:
			showing_warning = false
			is_falling = true

	if is_falling:
		box.position.y += fall_speed * delta
		if box.position.y > start_y + 900.0:
			_reset()

func _start_warning() -> void:
	showing_warning = true
	warning_timer = warning_time

func _reset() -> void:
	is_falling = false
	has_hit = false
	showing_warning = false
	box.position.y = start_y
	shadow.modulate.a = 0.0
	timer.start()

func _on_box_body_entered(body: Node2D) -> void:
	if body is Player and not has_hit:
		has_hit = true
		body.take_hit()
		_reset()
