extends Node

var lastLevel = "res://src/levels/Level1.tscn"

onready var mainScene = get_tree().root.get_node("root").get_node("MainDisplay")

func changeScene(pathToScene):
	var removable = mainScene.get_child(0)
	mainScene.remove_child(removable)

	var scene_to_instantiate = load(pathToScene)
	var instantiated_scene = scene_to_instantiate.instance()
	
	mainScene.add_child(instantiated_scene)
