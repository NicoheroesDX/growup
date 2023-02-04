extends Node2D

onready var player: KinematicBody2D = get_node("Player")

const projectilePath = preload('res://src/entities/Projectile.tscn')

func _process(delta):
	
	if Input.is_action_just_pressed("growup_shoot_up"):
		player_shoot(Vector2(0,-1000))
	if Input.is_action_just_pressed("growup_shoot_down"):
		player_shoot(Vector2(0,1000))
	if Input.is_action_just_pressed("growup_shoot_left"):
		player_shoot(Vector2(-1000,0))
	if Input.is_action_just_pressed("growup_shoot_right"):
		player_shoot(Vector2(1000,0))
	


func player_shoot(projectileVelocity):
	var projectile = projectilePath.instance()
	projectile.position = player.position
	projectile.velocity = projectileVelocity
	add_child(projectile)
	
