extends Node2D


const DungeonBoard := preload("res://scene/main/DungeonBoard.gd")
const Schedule := preload("res://scene/main/Schedule.gd")

const PC_ATTACK: String = "PCAttack"

var _get_coord := preload("res://library/ConvertCoord.gd").new()
var _group_name := preload("res://library/GroupName.gd").new()
var _input_name := preload("res://library/InputName.gd").new()

var _ref_DungeonBoard: DungeonBoard
var _ref_Schedule: Schedule

var _pc: Sprite


func _ready() -> void:
	set_process_unhandled_input(false)


func _unhandled_input(event: InputEvent) -> void:
	var pos: Array = _get_coord.vector_to_array(_pc.position)
	var target: Array = _get_new_position(event, pos)

	if (len(target) == 2) and _try_move(target):
		set_process_unhandled_input(false)
		_ref_Schedule.end_turn()


func _on_InitWorld_sprite_created(new_sprite: Sprite) -> void:
	if new_sprite.is_in_group(_group_name.PC):
		_pc = new_sprite
		_set_node_ref()
		set_process_unhandled_input(true)


func _on_Schedule_turn_started(current_sprite: Sprite) -> void:
	if current_sprite.is_in_group(_group_name.PC):
		set_process_unhandled_input(true)


func _get_new_position(event: InputEvent, source: Array) -> Array:
	var x: int = source[0]
	var y: int = source[1]

	if event.is_action_pressed(_input_name.MOVE_LEFT):
		x -= 1
	elif event.is_action_pressed(_input_name.MOVE_RIGHT):
		x += 1
	elif event.is_action_pressed(_input_name.MOVE_UP):
		y -= 1
	elif event.is_action_pressed(_input_name.MOVE_DOWN):
		y += 1
	else:
		return []
	return [x, y]


func _try_move(target: Array) -> bool:
	var x: int = target[0]
	var y: int = target[1]

	# if not _ref_DungeonBoard_is_inside_dungeon.call_func(x, y):
	if not _ref_DungeonBoard.is_inside_dungeon(x, y):
		print("bump")
		return false
	elif _ref_DungeonBoard.has_sprite(_group_name.WALL, x, y):
		print("wall")
		return false
	elif _ref_DungeonBoard.has_sprite(_group_name.DWARF, x, y):
		return get_node(PC_ATTACK).try_attack(_group_name.DWARF, x, y)
	else:
		_pc.position = _get_coord.index_to_vector(x, y)
		return true


func _set_node_ref() -> void:
	get_node(PC_ATTACK)._ref_DungeonBoard = _ref_DungeonBoard
	get_node(PC_ATTACK)._ref_Schedule = _ref_Schedule
