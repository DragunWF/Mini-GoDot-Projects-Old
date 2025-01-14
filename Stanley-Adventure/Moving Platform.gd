extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 100

var motion = Vector2()
var left = Vector2(-1, 0)
var right = Vector2(1, 0)
var direction = left

func _process(delta):
 motion.x = direction.x * SPEED
 motion = move_and_slide(motion, UP)
 if is_on_wall():
  if direction == left:
   direction = right
  elif direction == right:
   direction = left
