extends Control

func _on_Play_pressed():
 get_tree().change_scene("res://Levels/Tutorial.tscn")

func _on_Skip_pressed():
 get_tree().change_scene("res://Levels/Level 1.tscn")
