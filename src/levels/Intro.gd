extends Node2D

var animationTimer = 0

func _physics_process(delta):
	animationTimer += 1
	if animationTimer > 320:
		Global.changeScene("res://src/levels/Level0_1Tutorial.tscn")
