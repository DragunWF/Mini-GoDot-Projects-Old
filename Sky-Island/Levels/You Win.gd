extends Control


func _on_Return_pressed():
 get_tree().change_scene("res://Levels/Menu.tscn")

func _on_Exit_Game_pressed():
 get_tree().quit()
