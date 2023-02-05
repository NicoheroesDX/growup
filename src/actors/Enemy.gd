extends Actor

class_name Enemy

var moveCounter = 0
onready var player = get_parent().get_node("Player")

onready var hitSound = get_node("HitSound")
onready var sprite = get_node("AnimatedSprite")
onready var area = get_node("PlayerDetector")

var isHurt = false

var blinkingTimer = 0

var isThrown = false
var throwTimer = 0

var health = 0

func _ready():
	var rng = RandomNumberGenerator.new()
	health = rng.randf_range(1, 20)

func _process(delta):
	if blinkingTimer > 0:
		blinkingTimer += 1
		if blinkingTimer > 5:
			sprite.modulate = Color(1, 1, 1)
			blinkingTimer = 0

func _physics_process(delta):
	
	var overlapping_bodies = area.get_overlapping_bodies()
	
	if overlapping_bodies.size() > 0:
		for body in overlapping_bodies:
			if body.get_groups().has("player"):
				kill_player()
				break
	
	var playerPosition = player.get_position()
	var playerDistance = playerPosition.distance_to(self.get_position())
	throwTimer += 1
	if throwTimer > 25:
		isThrown = false
	if isThrown:
		var enemyPosition = self.get_position()
		velocity = playerPosition-enemyPosition
		velocity = move_and_slide(-velocity*2)
	else:
		if playerDistance < 100 || isHurt:
			attack_player(playerPosition)
		else:
			roam_around_randomly()

func attack_player(playerPos):
	var rng = RandomNumberGenerator.new()
	var enemyPos = self.get_position()
	var speedRange = rng.randf()*2
	velocity = playerPos-enemyPos
	
	if velocity.x > 1:
		sprite.scale.x = -1
	else:
		sprite.scale.x = 1
	
	velocity = move_and_slide(velocity*speedRange)

func roam_around_randomly():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	var speed = rng.randf_range(10, 80)
	var randomMoveCounter = rng.randf_range(5, 80)
	var randomMoveLimit = rng.randf_range(20, 100)
	
	if randomMoveLimit <= randomMoveCounter:
		randomMoveLimit = randomMoveCounter+10
	
	if moveCounter > randomMoveLimit:
		moveCounter = 0
	else:
		moveCounter += 1
	if moveCounter == 0:
		velocity = Vector2(randi() % 3 - 1, randi() % 3 - 1) * speed
	elif moveCounter > randomMoveCounter:
		velocity = Vector2(0, 0)
	
	if velocity.x > 1:
		sprite.scale.x = -1
	else:
		sprite.scale.x = 1
	
	velocity = move_and_slide(velocity)

func die():
	PlayerVariables.experience += 10
	queue_free()

func hurt(damage):
	isHurt = true
	sprite.modulate = Color(1, 0, 0)
	blinkingTimer = 1
	hitSound.play()
	health -= damage
	if (health <= 0):
		die()

func throw():
	throwTimer = 0
	isThrown = true

func kill_player():
	if player.isInvincible:
		return
	player.start_invincibility()
	PlayerVariables.health -= 1
	if PlayerVariables.health <= 0:
		Global.changeScene("res://src/transitions/GameOver.tscn")

func _on_PlayerDetector_body_entered(body):
	if (body.get_groups().has("player_attack")):
		die()
	if (body.get_groups().has("player")):
		kill_player()
