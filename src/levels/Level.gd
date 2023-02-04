extends Node2D

onready var player: KinematicBody2D = get_node("Player")

const MOVE = PlayerVariables.MOVE

const projectilePath = preload('res://src/entities/Projectile.tscn')

func _process(delta):
	if Input.is_action_just_pressed("growup_shoot_up"):
		player_shoot(Vector2(0,-300))
	if Input.is_action_just_pressed("growup_shoot_down"):
		player_shoot(Vector2(0,300))
	if Input.is_action_just_pressed("growup_shoot_left"):
		player_shoot(Vector2(-300,0))
	if Input.is_action_just_pressed("growup_shoot_right"):
		player_shoot(Vector2(300,0))

func player_shoot(projectileVelocity):
	
	if !PlayerVariables.learnedMoves.has(MOVE.LEAF_BLAST):
		return
	
	var projectile = projectilePath.instance()
	var spawnPosition = Vector2(player.position.x, player.position.y)
	projectile.position = spawnPosition
	projectile.velocity = projectileVelocity
	add_child(projectile)
