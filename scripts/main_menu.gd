extends Control

# This function runs when the Play button is clicked.
func _on_play_button_pressed():
	# Loads your main game level. Change "level_1.tscn" to your actual game scene's filename.
	get_tree().change_scene_to_file("res://scenes/Level_01.tscn")

# This function runs when the Quit button is clicked.
func _on_quit_button_pressed():
	# Closes the game application.
	get_tree().quit()
