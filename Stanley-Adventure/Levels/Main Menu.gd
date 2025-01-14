extends Control

var clicked = false

func _on_Start_Game_pressed():
 $Click.play()
 get_tree().change_scene("res://Levels/Play Tutorial.tscn")

func _on_Select_Level_pressed():
 $Click.play()
 get_tree().change_scene("res://Levels/Select Level2.tscn")

func _on_Exit_Game_pressed():
 $Click.play()
 get_tree().quit()
