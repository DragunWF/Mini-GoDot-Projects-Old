extends Control

func _ready():
 $ChooseMode.visible = false
 $ChooseDifficulty.visible = false
 $Credits.visible = false
 $CreditsButton.visible = false
 $Controls.visible = false
 $PvP.visible = false
 $PvPButton.visible = false

#Start Menu
func _on_Play_pressed():
 $ChooseMode.visible = true
 $StartMenu.visible = false
 $Click.play()

func _on_Credits_pressed():
 $StartMenu.visible = false
 $Credits.visible = true
 $CreditsButton.visible = true
 $Click.play()

func _on_Controls_pressed():
 $StartMenu.visible = false
 $Controls.visible = true
 $Click.play()

func _on_Quit_pressed():
 get_tree().quit()

#Choose Mode
func _on_PvE_pressed():
 $ChooseMode.visible = false
 $ChooseDifficulty.visible = true
 $Click.play()

func _on_PvP_pressed():
 $ChooseMode.visible = false
 $PvP.visible = true
 $PvPButton.visible = true
 $Click.play()

func _on_PlayPvP_pressed():
 get_tree().change_scene("res://Game Modes/PvP.tscn")

func _on_Back_pressed():
 $StartMenu.visible = true
 $ChooseMode.visible = false
 $Click.play()

#Choose Difficulty
func _on_Easy_pressed():
 get_tree().change_scene("res://Game Modes/PvE/Easy.tscn")

func _on_Normal_pressed():
 get_tree().change_scene("res://Game Modes/PvE/Normal.tscn")

func _on_Hard_pressed():
 get_tree().change_scene("res://Game Modes/PvE/Hard.tscn")

#Credits
func _on_BackC_pressed():
 $StartMenu.visible = true
 $Credits.visible = false
 $CreditsButton.visible = false
 $Click.play()

#Controls Menu
func _on_BackC2_pressed():
 $StartMenu.visible = true
 $Controls.visible = false
 $Click.play()
