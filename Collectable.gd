extends Area2D

class_name Collectable

var value = 0

func collect():
	PlayerVariables.experience += value
	print(PlayerVariables.experience)
	queue_free()
