extends Node2D


const PATH_TO_MAIN: String = "res://scene/main/MainScene.tscn"
const ROOT_NODE: String = "/root"


func reload() -> void:
	var new_scene: Node2D = load(PATH_TO_MAIN).instance()
	var old_scene: Node2D = get_tree().current_scene

	get_node(ROOT_NODE).add_child(new_scene)
	get_tree().current_scene = new_scene
	get_node(ROOT_NODE).remove_child(old_scene)
	old_scene.queue_free()
