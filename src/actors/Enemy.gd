extends Actor

class_name Enemy

var moveCounter = 0
onready var player = get_parent().get_node("Player")

onready var hitSound = get_node("HitSound")
onready var sprite = get_node("AnimatedSprite")

var blinkingTimer = 0

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
	var playerPosition = player.get_position()
	var playerDistance = playerPosition.distance_to(self.get_position())
	if playerDistance < 100:
		attack_player(playerPosition)
	else:
		roam_around_randomly()

func attack_player(playerPos):
	var rng = RandomNumberGenerator.new()
	var enemyPos = self.get_position()
	var speedRange = rng.randf()*2
	velocity = playerPos-enemyPos
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
	
	velocity = move_and_slide(velocity)

func die():
	PlayerVariables.experience += 10
	queue_free()

func hurt(damage):
	sprite.modulate = Color(1, 0, 0)
	blinkingTimer = 1
	hitSound.play()
	health -= damage
	if (health <= 0):
		die()

func kill_player():
	Global.changeScene("res://src/transitions/GameOver.tscn")

func _on_PlayerDetector_body_entered(body):
	if (body.get_groups().has("player_attack")):
		die()
	if (body.get_groups().has("player")):
		kill_player()
