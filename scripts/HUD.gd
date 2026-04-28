class_name HUD
extends CanvasLayer

@onready var stamina_label: Label = $StaminaLabel
@onready var lives_label: Label = $LivesLabel

func update_stamina(current: int) -> void:
	var bars := ""
	for i in range(3):
		bars += "[X]" if i < current else "[ ]"
	stamina_label.text = "Dash  " + bars

func update_lives(current: int) -> void:
	lives_label.text = "Lives: " + str(current)
