extends Node2D

class_name GameOverScreen

func _on_Button_pressed():
	Global.changeScene("res://src/levels/Level0.tscn")

func _on_NextLevelButton_pressed():
	Global.changeScene("res://src/levels/Level1.tscn")
