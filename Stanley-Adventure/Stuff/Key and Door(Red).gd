extends Node2D

var collected = false
var unlocked = false

func _ready():
 $Key/Collected.visible = false
 $Door/Unlocked.visible = false

func _on_Key_body_entered(body):
 if body.name == "Player" and collected==false:
  $Key/Collect.play()
  collected = true
  if collected==true:
   unlocked = true
   $Key/Collected.visible = true
   $Key/Key.visible = false
  if unlocked==true:
   $Door/Unlocked.visible = true
   $Door/Door.visible = false
  
func _on_Door_body_entered(body):
 if body.name == "Player" and unlocked==true:
  get_tree().change_scene("res://Levels/Main Menu.tscn")
