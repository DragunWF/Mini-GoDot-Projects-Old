extends Node2D

func _ready():
	pass 

func _process(delta):
	pass


func _on_Fall_Zone_tree_entered():
 get_tree().reload_current_scene()
