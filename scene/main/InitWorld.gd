extends Node2D

const wall_prefab := preload("res://scene/sprite/Wall.tscn")

func _ready():
	var wall := wall_prefab.instance()
	wall.position.x = 20
	wall.position.y = 20
	add_child(wall)
