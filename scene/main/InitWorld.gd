extends Node2D


signal sprite_created(new_sprite)

const Player := preload("res://sprite/PC.tscn")
const Dwarf := preload("res://sprite/Dwarf.tscn")
const Floor := preload("res://sprite/Floor.tscn")
const Wall := preload("res://sprite/Wall.tscn")
const ArrowX := preload("res://sprite/ArrowX.tscn")
const ArrowY := preload("res://sprite/ArrowY.tscn")

var _get_coord := preload("res://library/ConvertCoord.gd").new()
var _dungeon := preload("res://library/DungeonSize.gd").new()
var _group_name := preload("res://library/GroupName.gd").new()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("init_world"):
		_init_floor()
		_init_wall()
		_init_PC()
		_init_dwarf()
		_init_indicator()

		set_process_unhandled_input(false)


func _init_dwarf() -> void:
	for i in [[4, 5], [15, 6], [12, 13]]:
		_create_sprite(Dwarf, _group_name.DWARF, i[0], i[1])


func _init_PC() -> void:
	_create_sprite(Player, _group_name.PC, 0, 0)


func _init_floor() -> void:
	for i in range(_dungeon.MAX_X):
		for j in range(_dungeon.MAX_Y):
			_create_sprite(Floor, _group_name.FLOOR, i, j)


func _init_wall() -> void:
	for i in range(9, 13):
		for j in range(5, 9):
			_create_sprite(Wall, _group_name.WALL, i, j)


func _init_indicator() -> void:
	_create_sprite(ArrowX, _group_name.ARROW, 0, 12, -_dungeon.ARROW_MARGIN)
	_create_sprite(ArrowY, _group_name.ARROW, 5, 0, 0, -_dungeon.ARROW_MARGIN)


func _create_sprite(prefab: PackedScene, group: String, x: int, y: int,
		x_offset: int = 0, y_offset: int = 0) -> void:

	var new_sprite: Sprite = prefab.instance() as Sprite
	new_sprite.position = _get_coord.index_to_vector(x, y, x_offset, y_offset)
	new_sprite.add_to_group(group)

	add_child(new_sprite)
	emit_signal("sprite_created", new_sprite)
