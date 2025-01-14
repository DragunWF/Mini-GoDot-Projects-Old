extends Control

func _on_Start_pressed():
 get_tree().change_scene("res://Levels/Level 1.tscn")

func _on_Select_Level_pressed():
 get_tree().change_scene("res://Levels/Select level.tscn")

func _on_Exit_pressed():
 get_tree().quit()

