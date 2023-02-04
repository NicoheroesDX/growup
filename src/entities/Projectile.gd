extends KinematicBody2D

var velocity = Vector2()
var rotationSpeed = 6

func _process(delta):
	rotate(rotationSpeed * delta)	

func _physics_process(delta):
	velocity = move_and_slide(velocity)
