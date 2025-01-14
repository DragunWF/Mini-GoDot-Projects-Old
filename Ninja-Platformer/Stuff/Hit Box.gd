extends Area2D

func _ready():
	pass

func _process(delta):
	pass

func _on_Hit_Area_body_entered(body):
 get_tree().reload_current_scene()
