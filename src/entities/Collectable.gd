extends Area2D

class_name Collectable

var value = 0

var collected = false

var despawnTimer = 0

func _process(delta):
	if collected:
		despawnTimer += 1
		if despawnTimer > 50:
			queue_free()

func collect():
	if collected:
		return false
	collected = true
	PlayerVariables.experience += value
	return true
