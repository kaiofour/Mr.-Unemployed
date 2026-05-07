extends CanvasLayer

@onready var timer_label = $HUD/VBoxContainer/TimerLabel
@onready var level_timer = $LevelTimer

@onready var pause_menu = $PauseMenu
@onready var gameover_menu = $GameoverMenu
@onready var win_menu = $WinMenu

@onready var stamina_segs := [
	$HUD/VBoxContainer/StaminaBar/Seg1,
	$HUD/VBoxContainer/StaminaBar/Seg2,
	$HUD/VBoxContainer/StaminaBar/Seg3,
]
@onready var lives_icons := [
	$HUD/VBoxContainer/LivesDisplay/Icon1,
	$HUD/VBoxContainer/LivesDisplay/Icon2,
	$HUD/VBoxContainer/LivesDisplay/Icon3,
]

var tex_seg_full: Texture2D = preload("res://assets/ui/stamina_segment_full.png")
var tex_seg_empty: Texture2D = preload("res://assets/ui/stamina_segment_empty.png")

var time_left = 60 # Set your starting seconds here

func _ready():
	# Setup Timer
	level_timer.timeout.connect(_on_timer_tick)
	level_timer.start()
	
	# Connect Pause Menu Buttons
	$PauseMenu/PauseContainer/ButtonContainer/ResumeButton.pressed.connect(resume_game)
	$PauseMenu/PauseContainer/ButtonContainer/RetryButton.pressed.connect(retry_level)
	$PauseMenu/PauseContainer/ButtonContainer/MenuButton.pressed.connect(go_to_main_menu)
	
	# Connect Game Over Buttons
	$GameoverMenu/GameoverContainer/ButtonContainer/RetryButton.pressed.connect(retry_level)
	$GameoverMenu/GameoverContainer/ButtonContainer/MenuButton.pressed.connect(go_to_main_menu)
	
	# Connect Win Menu Buttons
	$WinMenu/WinContainer/ButtonContainer/NextButton.pressed.connect(next_level)
	$WinMenu/WinContainer/ButtonContainer/MenuButton.pressed.connect(go_to_main_menu)
	
	# Listen to your GameManager instead of handling lives internally
	GameManager.game_over.connect(trigger_game_over)
	
	resume_game()
	update_timer_display()

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if not gameover_menu.visible and not win_menu.visible:
			toggle_pause()

# --- Menu Logic ---
func toggle_pause():
	if get_tree().paused:
		resume_game()
	else:
		pause_game()

func pause_game():
	get_tree().paused = true
	pause_menu.show()

func resume_game():
	get_tree().paused = false
	pause_menu.hide()
	gameover_menu.hide()
	win_menu.hide()

func retry_level():
	get_tree().paused = false
	get_tree().reload_current_scene()

func go_to_main_menu():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn") 

func next_level():
	get_tree().paused = false
	var next := GameManager.get_next_level_path()
	if next.is_empty():
		go_to_main_menu()
		return
	GameManager.advance_level()
	get_tree().change_scene_to_file(next)

# --- Timer Logic ---
func _on_timer_tick():
	time_left -= 1
	update_timer_display()
	
	if time_left <= 0:
		level_timer.stop()
		GameManager.lose_life()
		if GameManager.lives > 0:
			retry_level() # Reset the level if they die to the clock but have lives

func update_timer_display():
	timer_label.text = "Time: " + str(time_left)

func trigger_game_over():
	get_tree().paused = true
	gameover_menu.show()

func trigger_win():
	level_timer.stop()
	get_tree().paused = true
	win_menu.show()

func update_stamina(current: int) -> void:
	for i in range(3):
		stamina_segs[i].texture = tex_seg_full if i < current else tex_seg_empty

func update_lives(current: int) -> void:
	for i in range(3):
		lives_icons[i].visible = i < current
