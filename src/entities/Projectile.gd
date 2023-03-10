extends CharacterBody2D

var rotationSpeed = 6

func _process(delta):
	rotate(rotationSpeed * delta)	

func _physics_process(delta):
	set_velocity(velocity)
	move_and_slide()
	velocity = velocity

func hurt_enemy(body):
	
	var enemy := body as Enemy
	
	enemy.hurt(2)

func destroy():
	queue_free()

func _on_Area2D_body_entered(body):
	if body.get_groups().has("enemy"):
		hurt_enemy(body)
		destroy()
	if body.get_groups().has("level"):
		destroy()
