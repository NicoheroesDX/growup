extends Actor

var moveCounter = 0
onready var player = get_parent().get_node("Player")

func _process(delta):
	var playerPosition = player.get_position()
	var playerDistance = playerPosition.distance_to(self.get_position())
	if playerDistance < 50:
		attack_player(playerPosition)
	else:
		roam_around_randomly()

func attack_player(playerPos):
	var rng = RandomNumberGenerator.new()
	var enemyPos = self.get_position()
	var speedRange = rng.randf()*5
	velocity = playerPos-enemyPos
	velocity = move_and_slide(velocity*speedRange)

func roam_around_randomly():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	var speed = rng.randf_range(50, 200)
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
	print(PlayerVariables.experience)
	queue_free()

func kill_player():
	print("YOOO YOU DEAD!!!")

func _on_PlayerDetector_body_entered(body):
	if (body.get_groups().has("player_attack")):
		die()
	if (body.get_groups().has("player")):
		kill_player()
