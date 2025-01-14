extends KinematicBody2D

const LASER = preload("res://Characters/Player 2/LaserP2.tscn")

var speed = 300
var movement = Vector2()
var alive = true

onready var timer = get_node("Timer")

func _ready():
 timer.set_one_shot(false)

func _process(delta):
 movement.y = 0
 if alive==true:
  if Input.is_key_pressed(KEY_D):
   movement.x = speed
  elif Input.is_key_pressed(KEY_A):
   movement.x = -speed
  else:
   movement.x = 0
  if Input.is_key_pressed(KEY_S):
   if timer.is_stopped():
	$LaserSound.play()
	shoot_laser()
	restart_timer()
 if alive==false:
  movement.x = 0

 movement = movement.normalized() * speed
 movement = move_and_slide(movement)

func shoot_laser():
 var laser = LASER.instance()
 get_parent().add_child(laser)
 laser.set_position(get_node("Position2D").get_global_position())

func restart_timer():
 timer.set_wait_time(.3)
 timer.start()
 
func _on_Timer_timeout():
 timer.set_one_shot(true)

func _on_HitArea_area_entered(area):
 $AnimatedSprite.play("Hit")
 alive = false

func _on_AnimatedSprite_animation_finished():
 if alive==false:
  queue_free()
