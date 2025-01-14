extends Control

var back = false

func _ready():
 $CenterContainer/VBoxContainer/Paused.visible = false
 $CenterContainer/VBoxContainer/Resume.visible = false
 $CenterContainer/VBoxContainer/Return.visible = false
 $CenterContainer/VBoxContainer/Quit.visible = false

func _input(event):
 if event.is_action_pressed("ui_cancel"):
  var new_pause_state = not get_tree().paused
  get_tree().paused = new_pause_state
  visible = new_pause_state
  $CenterContainer/VBoxContainer/Paused.visible = true
  $CenterContainer/VBoxContainer/Resume.visible = true
  $CenterContainer/VBoxContainer/Return.visible = true
  $CenterContainer/VBoxContainer/Quit.visible = true

func _on_Return_pressed():
 back = true
 $CenterContainer/VBoxContainer/Paused.visible = false
 $CenterContainer/VBoxContainer/Resume.visible = false
 $CenterContainer/VBoxContainer/Return.visible = false
 $CenterContainer/VBoxContainer/Quit.visible = false
 if back==true:
  get_tree().paused = false
  get_tree().change_scene("res://Levels/Main Menu.tscn")

func _on_Resume_pressed():
 var new_pause_state = not get_tree().paused
 get_tree().paused = new_pause_state
 visible = new_pause_state
 $CenterContainer/VBoxContainer/Paused.visible = true
 $CenterContainer/VBoxContainer/Resume.visible = true
 $CenterContainer/VBoxContainer/Return.visible = true
 $CenterContainer/VBoxContainer/Quit.visible = true

func _on_Quit_Game_pressed():
 get_tree().quit()

