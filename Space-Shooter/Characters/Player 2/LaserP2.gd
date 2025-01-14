extends Area2D

const SPEED = 500
var motion = Vector2()
var moving = true

func _ready():
 get_node("notifier").connect("screen_exited", self, "_on_screen_exited")

func _process(delta):
 motion = Vector2()
 if moving==true:
  motion.y += SPEED
 motion = motion.normalized() * SPEED
 position += motion * delta
 if moving==false:
  motion.y = 0

func _on_screen_exited():
 queue_free()

func _on_LaserP2_area_entered(area):
 if moving==true:
  $AnimatedSprite.play("Hit")
  moving = false

func _on_AnimatedSprite_animation_finished():
 if moving==false:
  queue_free()
