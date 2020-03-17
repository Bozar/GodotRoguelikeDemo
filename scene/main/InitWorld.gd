extends Node2D

const Wall := preload("res://sprite/Wall.tscn")
const ArrowX := preload("res://sprite/ArrowX.tscn")
const ArrowY := preload("res://sprite/ArrowY.tscn")

const START_X: int = 50
const START_Y: int = 54
const STEP_X: int = 26
const STEP_Y: int = 34
const MAX_X: int = 21
const MAX_Y: int = 15
const ARROW_MARGIN: int = 32


func _ready():
	_init_wall_block()
	_init_indicator()


func _init_wall_block() -> void:
	var wall: Sprite
	var x: int
	var y: int

	for i in range(MAX_X):
		for j in range(MAX_Y):
			if (i != 0) and (j != 0):
				continue

			x = START_X + STEP_X * i
			y = START_Y + STEP_Y * j

			wall = Wall.instance() as Sprite
			wall.position = Vector2(x, y)
			add_child(wall)


func _init_indicator() -> void:
	var indicator: Sprite
	var x: int
	var y: int

	x = START_X - ARROW_MARGIN
	y = START_Y + STEP_Y * 12
	indicator = ArrowX.instance() as Sprite
	indicator.position = Vector2(x, y)
	add_child(indicator)

	x = START_X + STEP_X * 5
	y = START_Y - ARROW_MARGIN
	indicator = ArrowY.instance() as Sprite
	indicator.position = Vector2(x, y)
	add_child(indicator)
