extends Node2D

onready var player: KinematicBody2D = get_node("Player")

const MOVE = PlayerVariables.MOVE

var playerShootTimer = 0
var playerShootTimerLimit = 0

const projectilePath = preload('res://src/entities/Projectile.tscn')

func _ready():
	PlayerVariables.calculate_shoot_cooldown()
	playerShootTimerLimit = PlayerVariables.playerShootLimit
	playerShootTimer = 0

func _physics_process(delta):
	
	if playerShootTimer > 0:
		playerShootTimer += 1
		if playerShootTimer > playerShootTimerLimit:
			playerShootTimer = 0
		else:
			return
	
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
	
	playerShootTimer = 1
	
	var projectile = projectilePath.instance()
	var spawnPosition = Vector2(player.position.x, player.position.y)
	projectile.position = spawnPosition
	projectile.velocity = projectileVelocity
	add_child(projectile)
	player.shootSound.play()

func _on_Porter_body_entered(body):
	if body.get_groups().has("player"):
		Global.lastLevel = "res://src/levels/Level2.tscn"
		Global.changeScene("res://src/levels/Level2.tscn")


func _on_PorterL2_body_entered(body):
	if body.get_groups().has("player"):
		Global.lastLevel = "res://src/levels/Level3.tscn"
		Global.changeScene("res://src/levels/Level3.tscn")


func _on_PorterL3_body_entered(body):
	if body.get_groups().has("player"):
		Global.lastLevel = "res://src/transitions/VictoryScreen.tscn"
		Global.changeScene("res://src/transitions/VictoryScreen.tscn")
