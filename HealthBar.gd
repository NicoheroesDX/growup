extends HBoxContainer

var startGraphic = "res://src/assets/gui/health/bar_start.png"
var filledHeartGraphic = "res://src/assets/gui/health/bar_filled.png"
var emptyHeartGraphic = "res://src/assets/gui/health/bar_empty.png"
var endGraphic = "res://src/assets/gui/health/bar_end.png"

# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerVariables.healthChanged.connect(updateHealth)
	updateHealth()

func updateHealth():
	for n in get_children():
		n.queue_free()
	for i in PlayerVariables.maxHealth + 2:
			var content = TextureRect.new()
			if (i == 0):
				content.texture = load(startGraphic)
			elif (i == PlayerVariables.maxHealth + 1):		
				content.texture = load(endGraphic)
			else:
				content.texture = load(filledHeartGraphic) if PlayerVariables.health >= i else load(emptyHeartGraphic)
			add_child(content)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
