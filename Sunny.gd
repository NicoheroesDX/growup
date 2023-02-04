extends Collectable

class_name Sunny

func _init():
	value = 30

func _on_Droppy_body_entered(body):
	if body.get_groups().has("player"):
		collect()
