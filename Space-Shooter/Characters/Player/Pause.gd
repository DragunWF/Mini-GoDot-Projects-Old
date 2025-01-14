extends Control

var pause = true

func _ready():
 $CenterContainer.visible = false

func _input(event):
 if pause==true:
  if event.is_action_pressed("ui_cancel"):
   var new_pause_state = not get_tree().paused
   get_tree().paused = new_pause_state
   visible = new_pause_state
   $CenterContainer.visible = true

func _on_Resume_pressed():
 var new_pause_state = not get_tree().paused
 get_tree().paused = new_pause_state
 visible = new_pause_state
 $CenterContainer.visible = true
 $Click.play()

func _on_Quit_pressed():
 get_tree().paused = false
 get_tree().change_scene("res://User Interface/Main Menu.tscn")

func _on_YouDied_visibility_changed():
 pause = false
