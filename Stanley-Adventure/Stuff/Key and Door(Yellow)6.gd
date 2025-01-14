extends Node2D

var key = false
var unlocked = false

func _ready():
 $Collected.visible = false
 $Unlocked.visible = false

func _on_Key_Area_body_entered(body):
 if body.name == "Player" and key==false:
  $Key/Collect.play()
  key = true
  if key==true:
   unlocked = true
   $Key.visible = false
   $Door.visible = false
   $Collected.visible = true
   $Unlocked.visible = true

func _on_Door_Area_body_entered(body):
 if body.name == "Player" and unlocked==true:
  get_tree().change_scene("res://Levels/Level 7.tscn")
