extends KinematicBody2D

var velocity = Vector2()
var rotationSpeed = 6

func _process(delta):
	rotate(rotationSpeed * delta)	

func _physics_process(delta):
	velocity = move_and_slide(velocity)

func kill_enemy(body):
	body.queue_free()
	PlayerVariables.experience += 10
	print(PlayerVariables.experience)

func destroy():
	queue_free()

func _on_Area2D_body_entered(body):
	if body.get_groups().has("enemy"):
		kill_enemy(body)
		destroy()
	if body.get_groups().has("level"):
		destroy()
