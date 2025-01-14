extends Node2D

var defeated1 = false
var defeated2 = false
var defeated3 = false
var repeat = true

func _ready():
 $YouWin/YouWin.visible = false

func _process(delta):
 if defeated1==true and defeated2==true and defeated3==true:
  $YouWin/YouWin.visible = true
  if repeat==true:
   $Win.play()
   repeat = false

#Enemy Kills
func _on_Enemy_tree_exited():
 defeated1 = true

func _on_Enemy2_tree_exited():
 defeated2 = true

func _on_Enemy3_tree_exited():
 defeated3 = true

#You Win Menu
func _on_Retry_pressed():
 get_tree().reload_current_scene()

func _on_Quit_pressed():
 get_tree().change_scene("res://User Interface/Main Menu.tscn")
