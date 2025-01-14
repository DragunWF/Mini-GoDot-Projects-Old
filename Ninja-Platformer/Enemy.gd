extends KinematicBody2D

var motion = Vector2()

func _ready():
	pass

func _physics_process(delta):
 motion.y += 6
 if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_up"):
  motion.x = -300
 if is_on_floor():
  motion.y = -400
 motion = move_and_slide(motion)

