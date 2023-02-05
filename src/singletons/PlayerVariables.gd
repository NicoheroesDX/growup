extends Node

var experience = 0
var health = 0

var size = 1

var playerSpeed = 0
var playerShootLimit = 0

enum MOVE { 
	DASH_MOVE, 
	TWO_LIFE,
	THREE_LIFE,
	FIVE_LIFE
	LEAF_BLAST, 
	DOUBLE_LEAF_BLAST, 
	ROOT_SLASH,
	SPEED_TWO,
	SPEED_FOUR,
	SPEED_SIX
	}

var learnedMoves = [MOVE.DASH_MOVE]

func learnMove(move):
	learnedMoves.push_back(move)

func calculate_size():
	size = learnedMoves.size()
	if size > 9:
		size = 9

func calculate_health():
	if learnedMoves.has(MOVE.FIVE_LIFE):
		health = 5
	elif learnedMoves.has(MOVE.THREE_LIFE):
		health = 3
	elif learnedMoves.has(MOVE.TWO_LIFE):
		health = 2
	else:
		health = 1

func calculate_shoot_cooldown():
	if learnedMoves.has(MOVE.DOUBLE_LEAF_BLAST):
		playerShootLimit = 10
	else: 
		playerShootLimit = 20

func calculate_speed():
	if learnedMoves.has(MOVE.SPEED_SIX):
		playerSpeed = 200
	elif learnedMoves.has(MOVE.SPEED_FOUR):
		playerSpeed = 150
	elif learnedMoves.has(MOVE.SPEED_TWO):
		playerSpeed = 100
	else:
		playerSpeed = 50
