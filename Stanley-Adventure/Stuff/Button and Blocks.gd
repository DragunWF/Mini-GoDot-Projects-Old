extends Node2D

var pushed = false
var open = false

func _ready():
 $Button/Pressed.visible = false
 $Blocks/Opened.visible = false
 $Blocks/Opened2.visible = false
 $Blocks/Opened3.visible = false

func _on_Button_body_entered(body):
 if body.name== "Player" and pushed==false:
  pushed = true
  open = true
  $Button/Push.play()
  $Button/Unpressed.visible = false
  $Blocks/Block.visible = false
  $Blocks/Block2.visible = false
  $Blocks/Block3.visible = false
  $Blocks/Opened.visible = true
  $Blocks/Opened2.visible = true
  $Blocks/Opened3.visible = true
  $Button/Pressed.visible = true
  if open==true:
   $Blocks/BlockCollision.queue_free()
  
