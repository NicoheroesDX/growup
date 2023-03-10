extends Area2D

class_name RootSlash

@onready var sprite = get_node("Sprite2D")
@onready var collider = get_node("CollisionShape2D")

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
