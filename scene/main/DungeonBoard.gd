extends Node2D


var _dungeon := preload("res://library/DungeonSize.gd").new()
var _group_name := preload("res://library/GroupName.gd").new()
var _coord := preload("res://library/ConvertCoord.gd").new()
# <string__group_name, <int__column, array__sprite>>
var _sprite_dict: Dictionary


func _ready() -> void:
	_init_dict()


func _on_InitWorld_sprite_created(new_sprite: Sprite) -> void:
	var pos: Array
	var group: String

	if new_sprite.is_in_group(_group_name.DWARF):
		group = _group_name.DWARF
	elif new_sprite.is_in_group(_group_name.WALL):
		group = _group_name.WALL
	else:
		return

	pos = _coord.vector_to_array(new_sprite.position)
	_sprite_dict[group][pos[0]][pos[1]] = new_sprite


func is_inside_dungeon(x: int, y: int) -> bool:
	return (x > -1) and (x < _dungeon.MAX_X) \
			and (y > -1) and (y < _dungeon.MAX_Y)


func has_sprite(group_name: String, x: int, y: int) -> bool:
	return get_sprite(group_name, x, y) != null


func get_sprite(group_name: String, x: int, y: int) -> Sprite:
	if not is_inside_dungeon(x, y):
		return null
	return _sprite_dict[group_name][x][y]


func _init_dict() -> void:
	var groups = [_group_name.DWARF, _group_name.WALL]

	for g in groups:
		_sprite_dict[g] = {}
		for x in range(_dungeon.MAX_X):
			_sprite_dict[g][x] = []
			_sprite_dict[g][x].resize(_dungeon.MAX_Y)
