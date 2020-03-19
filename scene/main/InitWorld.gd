extends Node2D


const Wall := preload("res://sprite/Wall.tscn")
const ArrowX := preload("res://sprite/ArrowX.tscn")
const ArrowY := preload("res://sprite/ArrowY.tscn")
const ConvertCoord := preload("res://library/ConvertCoord.gd")

const MAX_X: int = 21
const MAX_Y: int = 15
const ARROW_MARGIN: int = 32

var _get_coord: ConvertCoord = ConvertCoord.new()


func _ready() -> void:
	_init_wall_block()
	_init_indicator()


func _init_wall_block() -> void:
	var wall: Sprite

	for i in range(MAX_X):
		for j in range(MAX_Y):
			if (i != 0) and (j != 0):
				continue

			wall = Wall.instance() as Sprite
			wall.position = _get_coord.index_to_vector(i, j)
			add_child(wall)


func _init_indicator() -> void:
	var indicator: Sprite

	indicator = ArrowX.instance() as Sprite
	indicator.position = _get_coord.index_to_vector(0, 12, -ARROW_MARGIN)
	add_child(indicator)

	indicator = ArrowY.instance() as Sprite
	indicator.position = _get_coord.index_to_vector(5, 0, 0, -ARROW_MARGIN)
	add_child(indicator)
