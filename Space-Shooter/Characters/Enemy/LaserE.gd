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

func _on_LaserE_body_entered(body):
 if body.name=="Player":
  moving = false
  $AnimatedSprite.play("Hit")

func _on_LaserE_area_entered(area):
 if area.name=="LaserP":
  moving = false
  $AnimatedSprite.play("Hit")

func _on_AnimatedSprite_animation_finished():
 if moving==false:
  queue_free()

