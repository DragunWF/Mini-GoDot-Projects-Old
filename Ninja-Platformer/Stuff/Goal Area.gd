extends Area2D

func _ready():
	pass

func _process(delta):
	pass

func _on_Goal_Area_body_entered(body):
 get_tree().change_scene("res://Stuff/Level 3.tscn")