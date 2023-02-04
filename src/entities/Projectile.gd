extends KinematicBody2D

var velocity = Vector2()
var rotationSpeed = 6

func _process(delta):
	rotate(rotationSpeed * delta)	

func _physics_process(delta):
	velocity = move_and_slide(velocity)

func _on_Area2D_body_entered(body):
	if body.get_groups().has("enemy"):
		body.queue_free()
		queue_free()
	if body.get_groups().has("level"):
		queue_free()
