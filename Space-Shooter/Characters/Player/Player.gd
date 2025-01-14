extends KinematicBody2D

const LASER = preload("res://Characters/Player/LaserP.tscn")

var speed = 300
var movement = Vector2()
var alive = true
var repeat = true

onready var timer = get_node("Timer")

func _ready():
 $YouDied/YouDied.visible = false
 timer.set_one_shot(false)

func _process(delta):
 movement.y = 0
 if alive==true:
  if Input.is_action_pressed("ui_right"):
   movement.x = speed
  elif Input.is_action_pressed("ui_left"):
   movement.x = -speed
  else:
   movement.x = 0
  if Input.is_action_just_pressed("ui_accept"):
   if timer.is_stopped():
	$LaserSound.play()
	shoot_laser()
	restart_timer()
 if alive==false:
  movement.x = 0
  gameover_audio()

 if movement.length() > 0:
  $Trail.emitting = false
 else:
  $Trail.emitting = false

 movement = movement.normalized() * speed
 movement = move_and_slide(movement)

func shoot_laser():
 var laser = LASER.instance()
 get_parent().add_child(laser)
 laser.set_position(get_node("Position2D").get_global_position())

func restart_timer():
 timer.set_wait_time(1)
 timer.start()
 
func _on_Timer_timeout():
 timer.set_one_shot(true)

func _on_HitArea_area_entered(area):
 $AnimatedSprite.play("Hit")
 alive = false

func _on_AnimatedSprite_animation_finished():
 if alive==false:
  $YouDied/YouDied.visible = true
  $AnimatedSprite.play("Destroyed")

#Game Over Menu
func _on_Retry_pressed():
 get_tree().reload_current_scene()

func _on_Quit2_pressed():
 get_tree().change_scene("res://User Interface/Main Menu.tscn")

#Game Over Audio
func gameover_audio():
 if repeat==true:
  $Lose.play()
  repeat = false
