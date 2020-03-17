extends Node2D

const wall_prefab := preload("res://scene/sprite/Wall.tscn")
const arrow_x_prefab := preload("res://scene/sprite/ArrowX.tscn")
const arrow_y_prefab := preload("res://scene/sprite/ArrowY.tscn")

const _start_x: int = 50
const _start_y: int = 54
const _step_x: int = 26
const _step_y: int = 34
const _max_x: int = 21
const _max_y: int = 15
const _indicator: int = 32


func _ready():
	_init_wall_block()
	_init_indicator()


func _init_wall_block() -> void:
	var wall: Sprite
	var x: int
	var y: int

	for i in range(_max_x):
		for j in range(_max_y):
			if (i != 0) and (j != 0):
				continue

			x = _start_x + _step_x * i
			y = _start_y + _step_y * j

			wall = wall_prefab.instance() as Sprite
			wall.position = Vector2(x, y)
			add_child(wall)


func _init_indicator() -> void:
	var indicator: Sprite
	var x: int
	var y: int

	x = _start_x - _indicator
	y = _start_y + _step_y * 12
	indicator = arrow_x_prefab.instance() as Sprite
	indicator.position = Vector2(x, y)
	add_child(indicator)

	x = _start_x + _step_x * 5
	y = _start_y - _indicator
	indicator = arrow_y_prefab.instance() as Sprite
	indicator.position = Vector2(x, y)
	add_child(indicator)
