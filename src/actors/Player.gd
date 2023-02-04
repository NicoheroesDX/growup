extends Actor

const projectilePath = preload('res://src/entities/Projectile.tscn')

var experience = 0

func _ready():
	speed = 200

func control_player():
	velocity = Vector2()
	if Input.is_action_pressed("growup_up"):
		velocity.y -= 1
	if Input.is_action_pressed("growup_left"):
		velocity.x -= 1
	if Input.is_action_pressed("growup_right"):
		velocity.x += 1
	if Input.is_action_pressed("growup_down"):
		velocity.y += 1
	
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	control_player()
	velocity = move_and_slide(velocity)
