extends Collectable

class_name Droppy

func _init():
	value = 10

func _on_Droppy_body_entered(body):
	if body.get_groups().has("player"):
		collect()
