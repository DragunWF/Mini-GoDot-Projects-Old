extends Node2D

var draw1 = false
var draw2 = false

func _ready():
 $P1Win/P1Win.visible = false
 $P2Win/P2Win.visible = false
 $Draw/Draw.visible = false

func _process(delta):
 if draw1==true and draw2==true:
  $Draw/Draw.visible = true
  $P1Win/P1Win.visible = false
  $P2Win/P2Win.visible = false
  
#Player Win Detections
func _on_Player1_tree_exited():
 $P2Win/P2Win.visible = true
 draw1 = true
 $P1.play()

func _on_Player2_tree_exited():
 $P1Win/P1Win.visible = true
 draw2 = true
 $P2.play()

#Player Win Menu
func _on_Retry_pressed():
 get_tree().reload_current_scene()

func _on_Quit_pressed():
 get_tree().change_scene("res://User Interface/Main Menu.tscn")

func _on_Retry2_pressed():
 get_tree().reload_current_scene()

func _on_Quit2_pressed():
 get_tree().change_scene("res://User Interface/Main Menu.tscn")

#Draw Menu
func _on_Retry3_pressed():
 get_tree().reload_current_scene()

func _on_Quit3_pressed():
 get_tree().change_scene("res://User Interface/Main Menu.tscn")

