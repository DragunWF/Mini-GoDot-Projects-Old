extends KinematicBody2D

const LASER = preload("res://Characters/Enemy/LaserE.tscn")

var alive = true
var motion = Vector2()
var left = Vector2(-1, 0)
var right = Vector2(1, 0)
var direction = left

onready var timer = get_node("Timer")

func _ready():
 timer.set_one_shot(false)
 restart_timer()

func _process(delta):
 if alive==true:
  motion.x = direction.x * 275
 if alive==false:
  motion.x = 0
 motion = move_and_slide(motion)
 if is_on_wall():
  if direction == left:
   direction = right
  elif direction == right:
   direction = left

func restart_timer():
 if alive==true:
  timer.set_wait_time(.5)
  timer.start()

func _on_Timer_timeout():
 if alive==true:
  shoot_laser()
  restart_timer()

func shoot_laser():
 var laser = LASER.instance()
 $LaserSound.play()
 get_parent().add_child(laser)
 laser.set_position(get_node("Position").get_global_position())

func _on_HitArea_area_entered(area):
 if area.name == "LaserP" and alive == true:
  alive = false
  $AnimatedSprite.play("Hit")

func _on_AnimatedSprite_animation_finished():
 if alive==false:
  queue_free()
