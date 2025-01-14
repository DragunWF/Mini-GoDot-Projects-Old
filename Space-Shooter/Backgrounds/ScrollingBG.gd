extends KinematicBody2D

var motion = Vector2()

func _process(delta):
 motion.y = -50

 motion = move_and_slide(motion)