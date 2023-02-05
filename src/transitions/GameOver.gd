extends Node2D

class_name GameOverScreen

const MOVE = PlayerVariables.MOVE

onready var deathSound = get_node("DeathSound")

func _ready():
	deathSound.play()

func _on_Button_pressed():
	Global.changeScene("res://src/levels/Level0.tscn")

func _on_NextLevelButton_pressed():
	Global.changeScene("res://src/levels/Level1.tscn")

func _on_DashBTN_pressed():
	if !PlayerVariables.learnedMoves.has(MOVE.DASH_MOVE):
		PlayerVariables.learnMove(MOVE.DASH_MOVE)

func _on_LeafBlastBTN_pressed():
	if !PlayerVariables.learnedMoves.has(MOVE.LEAF_BLAST):
		PlayerVariables.learnMove(MOVE.LEAF_BLAST)

func _on_RootStrikeBTN_pressed():
	if !PlayerVariables.learnedMoves.has(MOVE.ROOT_SLASH):
		PlayerVariables.learnMove(MOVE.ROOT_SLASH)
