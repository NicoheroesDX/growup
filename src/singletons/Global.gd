extends Node

var lastLevel = "res://src/levels/Level1.tscn"

var mainScene = null

func _ready():
	if (get_tree().root != null && 
	get_tree().root.get_node("root") != null && 
	get_tree().root.get_node("root").get_node("MainDisplay") != null):
		mainScene = get_tree().root.get_node("root").get_node("MainDisplay")

func isDebugModeActive():
	return mainScene == null

func changeScene(pathToScene):
	if (mainScene != null):
		var removable = mainScene.get_child(0)
		mainScene.remove_child(removable)

		var scene_to_instantiate = load(pathToScene)
		var instantiated_scene = scene_to_instantiate.instantiate()
		
		mainScene.add_child(instantiated_scene)
