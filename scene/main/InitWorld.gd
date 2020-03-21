extends Node2D


const Player := preload("res://sprite/PC.tscn")
const Dwarf := preload("res://sprite/Dwarf.tscn")
const Floor := preload("res://sprite/Floor.tscn")
const Wall := preload("res://sprite/Wall.tscn")
const ArrowX := preload("res://sprite/ArrowX.tscn")
const ArrowY := preload("res://sprite/ArrowY.tscn")

const ConvertCoord := preload("res://library/ConvertCoord.gd")

const MAX_X: int = 21
const MAX_Y: int = 15
const ARROW_MARGIN: int = 32

var _get_coord: ConvertCoord = ConvertCoord.new()


func _ready() -> void:
	_init_floor()
	_init_wall()
	_init_PC()
	_init_dwarf()
	_init_indicator()


func _init_dwarf() -> void:
	for i in [[4, 5], [15, 6], [12, 13]]:
		_create_sprite(Dwarf, i[0], i[1])


func _init_PC() -> void:
	_create_sprite(Player, 0, 0)


func _init_floor() -> void:
	for i in range(MAX_X):
		for j in range(MAX_Y):
			_create_sprite(Floor, i, j)


func _init_wall() -> void:
	for i in range(9, 13):
		for j in range(5, 9):
			_create_sprite(Wall, i, j)


func _init_indicator() -> void:
	_create_sprite(ArrowX, 0, 12, -ARROW_MARGIN)
	_create_sprite(ArrowY, 5, 0, 0, -ARROW_MARGIN)


func _create_sprite(prefab: PackedScene, x: int, y: int,
		x_offset: int = 0, y_offset: int = 0) -> void:
	var new_sprite: Sprite

	new_sprite = prefab.instance() as Sprite
	new_sprite.position = _get_coord.index_to_vector(x, y, x_offset, y_offset)
	add_child(new_sprite)
