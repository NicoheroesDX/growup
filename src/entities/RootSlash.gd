extends Area2D

class_name RootSlash

onready var sprite = get_node("Sprite")
onready var collider = get_node("CollisionShape2D")

var originalColliderShape
var originalColliderPos

var collsion = false
var isActive = false
var timer = 0

const RANGE = 2

func _ready():
	originalColliderShape = collider.shape
	originalColliderPos = collider.position

func toggle_collision(isCollidable):
	collsion = isCollidable

func _physics_process(delta):
	if isActive:
		timer += 1
		if timer > 16:
			collider.shape = originalColliderShape
			collider.position = originalColliderPos
			isActive = false
			timer = 0
		else:
			if timer > 8:
				collider.shape.set_extents(collider.shape.get_extents() + Vector2(-1*RANGE,0))
				collider.position.x -= RANGE
			else:
				collider.shape.set_extents(collider.shape.get_extents() + Vector2(RANGE,0))
				collider.position.x += RANGE 
				

func execute():
	toggle_collision(true)
	sprite.frame = 0
	isActive = true

func hurt_enemy(body):
	var enemy := body as Enemy
	enemy.hurt(5)
	enemy.throw()

func _on_RootSlash_body_entered(body):
	if !collsion:
		return
	if body.get_groups().has("enemy"):
		hurt_enemy(body)
