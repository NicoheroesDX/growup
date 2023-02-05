extends Actor

const projectilePath = preload('res://src/entities/Projectile.tscn')

var isDashing = false

const MOVE = PlayerVariables.MOVE

onready var shootSound = get_node("ShootSound")
onready var dashSound = get_node("DashSound")

onready var rootSlash = get_node("RootSlash")

var isRootSlashing = false
var rootSlashTimer = 0

var dashCoolDown = 25
var dashTimer = 0
var dashLength = 10
var dashSpeed = 250

func _ready():
	rootSlash.hide()
	rootSlash.toggle_collision(false)
	speed = 50

func use_root_slash():
	if isRootSlashing:
		return
	#rootSlash.rotation = 0
	rootSlashTimer = 1
	isRootSlashing = true
	rootSlash.show()
	rootSlash.execute()

func stop_root_slash():
	isRootSlashing = false
	rootSlashTimer = 0
	rootSlash.hide()
	rootSlash.toggle_collision(false)

func control_player():
	
	if PlayerVariables.learnedMoves.has(MOVE.ROOT_SLASH) && Input.is_action_just_pressed("growup_slash") && !isRootSlashing:
		use_root_slash()
	
	if !PlayerVariables.learnedMoves.has(MOVE.DASH_MOVE):
		isDashing = false
	
	if !isDashing:
		velocity = Vector2()
		if Input.is_action_pressed("growup_up"):
			velocity.y -= 1
		if Input.is_action_pressed("growup_left"):
			velocity.x -= 1
		if Input.is_action_pressed("growup_right"):
			velocity.x += 1
		if Input.is_action_pressed("growup_down"):
			velocity.y += 1
		
		if PlayerVariables.learnedMoves.has(MOVE.DASH_MOVE) && dashTimer == 0 && Input.is_action_just_pressed("growup_dash"):
			dashSound.play()
			velocity = velocity.normalized() * dashSpeed
			dashTimer += 1
			isDashing = true
		else:
			velocity = velocity.normalized() * speed
	else:
		velocity = velocity.normalized() * dashSpeed

func _physics_process(delta):
	
	if rootSlashTimer > 0:
		rootSlash.rotate(0.4)
		rootSlashTimer += 1
		if rootSlashTimer > 25:
			stop_root_slash()
	
	if (dashTimer > 0):
		dashTimer+=1
		if (dashTimer > dashLength):
			isDashing = false
		if (dashTimer > dashCoolDown):
			dashTimer = 0
			isDashing = false
	control_player()
	velocity = move_and_slide(velocity)
