extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200

var motion = Vector2()
var left = Vector2(-1, 0)
var right = Vector2(1, 0)
var direction = left

func _physics_process(delta):
 $AnimatedSprite.play("walk")
 motion.y += GRAVITY
 motion.x = direction.x * SPEED
 motion = move_and_slide(motion, UP)
 if is_on_wall():
  if direction == left:
   direction = right
  elif direction == right:
   direction = left
 if direction==right:
  $AnimatedSprite.flip_h = false
 if direction==left:
  $AnimatedSprite.flip_h = true
 
func _on_Zombiehit_body_entered(body):
 if body.name == "Player":
  get_tree().reload_current_scene()
