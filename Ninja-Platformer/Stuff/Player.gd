extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()

func _ready():
	pass

func _physics_process(delta):
 motion.y += 6
 if Input.is_action_pressed("ui_right"):
  motion.x = 300
  $head.flip_h = false;
  $body.flip_h = false;
 elif Input.is_action_pressed("ui_left"):
  motion.x = -300
  $head.flip_h = true;
  $body.flip_h = true;
 else:
  motion.x = 0
 if Input.is_action_pressed("ui_up") and is_on_floor():
  motion.y = -400
 
 motion = move_and_slide(motion, UP)


 

