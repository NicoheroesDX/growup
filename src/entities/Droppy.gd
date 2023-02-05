extends Collectable

class_name Droppy

onready var collectSound = get_node("CollectSound")
onready var sprite = get_node("Sprite")

func _init():
	value = 10

func _on_Droppy_body_entered(body):
	if body.get_groups().has("player"):
		collectSound.play()
		sprite.hide()
		collect()
