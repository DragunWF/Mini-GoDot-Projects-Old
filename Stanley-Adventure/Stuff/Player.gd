extends KinematicBody2D

const GRAVITY = 20
const MAX_SPEED = 200
const ACCELERATION = 50
const JUMP_HEIGHT = -550
const UP = Vector2(0, -1)
var motion = Vector2()

func _ready():
	pass

func _physics_process(delta):
 var friction = false
 motion.y += GRAVITY
 if Input.is_action_pressed("ui_right"):
  motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
  $AnimatedSprite.flip_h = false;
  $AnimatedSprite.play("walk")
 elif Input.is_action_pressed("ui_left"):
  motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
  $AnimatedSprite.flip_h = true;
  $AnimatedSprite.play("walk")
 else:
  friction = true
  $AnimatedSprite.play("idle")

 if is_on_floor():
  if Input.is_action_just_pressed("ui_up"):
   motion.y = JUMP_HEIGHT
  if friction == true:
   motion.x = lerp(motion.x, 0, 0.2)
 else:
  if motion.y < 0:
   $AnimatedSprite.play("jump")
  else:
   $AnimatedSprite.play("fall")
  if friction == true:
   motion.x = lerp(motion.x, 0, 0.05)
 
 motion = move_and_slide(motion, UP)
