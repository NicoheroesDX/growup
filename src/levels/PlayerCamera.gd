extends Camera2D

onready var player: KinematicBody2D = get_parent().get_node("Player")

func _process(delta):
	position.x=player.position.x
	position.y=player.position.y
