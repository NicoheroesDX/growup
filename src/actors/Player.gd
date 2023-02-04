extends Actor

const projectilePath = preload('res://src/entities/Projectile.tscn')

var isDashing = false

var dashCoolDown = 25
var dashTimer = 0
var dashLength = 10
var dashSpeed = 1000

func _ready():
	speed = 200

func control_player():
	
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
		
		if dashTimer == 0 && Input.is_action_just_pressed("growup_dash"):
			velocity = velocity.normalized() * dashSpeed
			dashTimer += 1
			isDashing = true
		else:
			velocity = velocity.normalized() * speed
	else:
		velocity = velocity.normalized() * dashSpeed

func _physics_process(delta):
	if (dashTimer > 0):
		dashTimer+=1
		if (dashTimer > dashLength):
			isDashing = false
		if (dashTimer > dashCoolDown):
			dashTimer = 0
			isDashing = false
	control_player()
	velocity = move_and_slide(velocity)
