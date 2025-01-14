extends Node2D

func _ready():
	pass

func _process(delta):
 if Input.is_action_pressed("ui_cancel"):
	 get_tree().reload_current_scene()
