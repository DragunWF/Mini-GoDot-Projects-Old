extends Sprite

func _on_Spikebox_body_entered(body):
 if body.name == "Player":
   get_tree().reload_current_scene()
