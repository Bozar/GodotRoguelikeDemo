extends Node2D


func remove(group_name: String, x: int, y: int) -> void:
	print("remove: {0}: {1}, {2}".format([group_name, x, y]))
