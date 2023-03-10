extends Collectable

class_name Sunny

@onready var collectSound = get_node("CollectSound")
@onready var sprite = get_node("Sprite2D")

func _init():
	value = 30

func _on_Droppy_body_entered(body):
	if body.get_groups().has("player"):
		sprite.hide()
		if (collect()):
			collectSound.play()
