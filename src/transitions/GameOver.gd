extends Node2D

class_name GameOverScreen

const MOVE = PlayerVariables.MOVE

const priceAbilityDash = 0
const priceAbilityLeaf1 = 100
const priceAbilityLeaf2 = 200
const priceAbilityRoot = 300
const priceAbilityHeart1 = 100
const priceAbilityHeart2 = 200
const priceAbilityHeart3 = 300
const priceAbilitySpeed1 = 100
const priceAbilitySpeed2 = 200
const priceAbilitySpeed3 = 300

onready var buttonAbilityDash = get_node("AbilityDash")
onready var buttonAbilityLeaf1 = get_node("AbilityLeaf1")
onready var buttonAbilityLeaf2 = get_node("AbilityLeaf2")
onready var buttonAbilityRoot = get_node("AbilityRoot")
onready var buttonAbilityHeart1 = get_node("AbilityHeart1")
onready var buttonAbilityHeart2 = get_node("AbilityHeart2")
onready var buttonAbilityHeart3 = get_node("AbilityHeart3")
onready var buttonAbilitySpeed1 = get_node("AbilitySpeed1")
onready var buttonAbilitySpeed2 = get_node("AbilitySpeed2")
onready var buttonAbilitySpeed3 = get_node("AbilitySpeed3")

onready var labelDash = get_node("AbilityDash/LabelDash")
onready var labelLeaf1 = get_node("AbilityLeaf1/LabelLeaf1")
onready var labelLeaf2 = get_node("AbilityLeaf2/LabelLeaf2")
onready var labelRoot = get_node("AbilityRoot/LabelRoot")
onready var labelHeart1 = get_node("AbilityHeart1/LabelHeart1")
onready var labelHeart2 = get_node("AbilityHeart2/LabelHeart2")
onready var labelHeart3 = get_node("AbilityHeart3/LabelHeart3")
onready var labelSpeed1 = get_node("AbilitySpeed1/LabelSpeed1")
onready var labelSpeed2 = get_node("AbilitySpeed2/LabelSpeed2")
onready var labelSpeed3 = get_node("AbilitySpeed3/LabelSpeed3")

onready var deathSound = get_node("DeathSound")

func refresh_screen():
	labelDash.text = "Price: " + str(priceAbilityDash)
	labelLeaf1.text = "Price: " + str(priceAbilityLeaf1)
	labelLeaf2.text = "Price: " + str(priceAbilityLeaf2)
	labelRoot.text = "Price: " + str(priceAbilityRoot)
	labelHeart1.text = "Price: " + str(priceAbilityHeart1)
	labelHeart2.text = "Price: " + str(priceAbilityHeart2)
	labelHeart3.text = "Price: " + str(priceAbilityHeart3)
	labelSpeed1.text = "Price: " + str(priceAbilitySpeed1)
	labelSpeed2.text = "Price: " + str(priceAbilitySpeed2)
	labelSpeed3.text = "Price: " + str(priceAbilitySpeed3)
	
	if PlayerVariables.learnedMoves.has(MOVE.DASH_MOVE):
		labelDash.text = "Already learned"
		buttonAbilityDash.disabled = true;
	if PlayerVariables.learnedMoves.has(MOVE.LEAF_BLAST):
		labelLeaf1.text = "Already learned"
		buttonAbilityLeaf1.disabled = true;
	if PlayerVariables.learnedMoves.has(MOVE.DOUBLE_LEAF_BLAST):
		labelLeaf2.text = "Already learned"
		buttonAbilityLeaf2.disabled = true;
	if PlayerVariables.learnedMoves.has(MOVE.ROOT_SLASH):
		labelRoot.text = "Already learned"
		buttonAbilityRoot.disabled = true;
	if PlayerVariables.learnedMoves.has(MOVE.TWO_LIFE):
		labelHeart1.text = "Already learned"
		buttonAbilityHeart1.disabled = true;
	if PlayerVariables.learnedMoves.has(MOVE.THREE_LIFE):
		labelHeart2.text = "Already learned"
		buttonAbilityHeart2.disabled = true;
	if PlayerVariables.learnedMoves.has(MOVE.FIVE_LIFE):
		labelHeart3.text = "Already learned"
		buttonAbilityHeart3.disabled = true;
	if PlayerVariables.learnedMoves.has(MOVE.SPEED_TWO):
		labelSpeed1.text = "Already learned"
		buttonAbilitySpeed1.disabled = true;
	if PlayerVariables.learnedMoves.has(MOVE.SPEED_FOUR):
		labelSpeed2.text = "Already learned"
		buttonAbilitySpeed2.disabled = true;
	if PlayerVariables.learnedMoves.has(MOVE.SPEED_SIX):
		labelSpeed3.text = "Already learned"
		buttonAbilitySpeed3.disabled = true;

func _ready():
	refresh_screen()

func _on_Button_pressed():
	Global.changeScene("res://src/levels/Level0.tscn")

func _on_NextLevelButton_pressed():
	Global.changeScene("res://src/levels/Level1.tscn")

func _on_AbilityDash_pressed():
	if !PlayerVariables.learnedMoves.has(MOVE.DASH_MOVE):
		PlayerVariables.learnMove(MOVE.DASH_MOVE)
		buttonAbilityDash.disabled = true;
	refresh_screen()

func _on_AbilityLeaf1_pressed():
	if !PlayerVariables.learnedMoves.has(MOVE.LEAF_BLAST):
		PlayerVariables.learnMove(MOVE.LEAF_BLAST)
		buttonAbilityLeaf1.disabled = true;
	refresh_screen()

func _on_AbilityLeaf2_pressed():
	if !PlayerVariables.learnedMoves.has(MOVE.DOUBLE_LEAF_BLAST):
		PlayerVariables.learnMove(MOVE.DOUBLE_LEAF_BLAST)
		buttonAbilityLeaf2.disabled = true;
	refresh_screen()

func _on_AbilityRoot_pressed():
	if !PlayerVariables.learnedMoves.has(MOVE.ROOT_SLASH):
		PlayerVariables.learnMove(MOVE.ROOT_SLASH)
		buttonAbilityRoot.disabled = true;
	refresh_screen()

func _on_AbilityHeart1_pressed():
	if !PlayerVariables.learnedMoves.has(MOVE.TWO_LIFE):
		PlayerVariables.learnMove(MOVE.TWO_LIFE)
		buttonAbilityHeart1.disabled = true;
	refresh_screen()

func _on_AbilityHeart2_pressed():
	if !PlayerVariables.learnedMoves.has(MOVE.THREE_LIFE):
		PlayerVariables.learnMove(MOVE.THREE_LIFE)
		buttonAbilityHeart2.disabled = true;
	refresh_screen()

func _on_AbilityHeart3_pressed():
	if !PlayerVariables.learnedMoves.has(MOVE.FIVE_LIFE):
		PlayerVariables.learnMove(MOVE.FIVE_LIFE)
		buttonAbilityHeart3.disabled = true;
	refresh_screen()

func _on_AbilitySpeed1_pressed():
	if !PlayerVariables.learnedMoves.has(MOVE.SPEED_TWO):
		PlayerVariables.learnMove(MOVE.SPEED_TWO)
		buttonAbilitySpeed1.disabled = true;
	refresh_screen()

func _on_AbilitySpeed2_pressed():
	if !PlayerVariables.learnedMoves.has(MOVE.SPEED_FOUR):
		PlayerVariables.learnMove(MOVE.SPEED_FOUR)
		buttonAbilitySpeed2.disabled = true;
	refresh_screen()

func _on_AbilitySpeed3_pressed():
	if !PlayerVariables.learnedMoves.has(MOVE.SPEED_SIX):
		PlayerVariables.learnMove(MOVE.SPEED_SIX)
		buttonAbilitySpeed3.disabled = true;
	refresh_screen()
