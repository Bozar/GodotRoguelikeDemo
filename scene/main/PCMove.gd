extends Node2D


const DungeonBoard := preload("res://scene/main/DungeonBoard.gd")
const Schedule := preload("res://scene/main/Schedule.gd")

const PC_ATTACK: String = "PCAttack"

var _ref_DungeonBoard: DungeonBoard
var _ref_Schedule: Schedule

var _new_ConvertCoord := preload("res://library/ConvertCoord.gd").new()
var _new_GroupName := preload("res://library/GroupName.gd").new()
var _new_InputName := preload("res://library/InputName.gd").new()

var _pc: Sprite


func _ready() -> void:
	set_process_unhandled_input(false)


func _unhandled_input(event: InputEvent) -> void:
	var source: Array = _new_ConvertCoord.vector_to_array(_pc.position)
	var target: Array = _get_new_position(event, source)

	if _is_wait(event) or (target[0] and _try_move(target[1], target[2])):
		set_process_unhandled_input(false)
		_ref_Schedule.end_turn()


func _on_InitWorld_sprite_created(new_sprite: Sprite) -> void:
	if new_sprite.is_in_group(_new_GroupName.PC):
		_pc = new_sprite
		set_process_unhandled_input(true)


func _on_Schedule_turn_started(current_sprite: Sprite) -> void:
	if current_sprite.is_in_group(_new_GroupName.PC):
		set_process_unhandled_input(true)


func _is_wait(event: InputEvent) -> bool:
	if event.is_action_pressed(_new_InputName.WAIT):
		print("wait")
		return true
	return false


func _get_new_position(event: InputEvent, source: Array) -> Array:
	var x: int = source[0]
	var y: int = source[1]

	if event.is_action_pressed(_new_InputName.MOVE_LEFT):
		x -= 1
	elif event.is_action_pressed(_new_InputName.MOVE_RIGHT):
		x += 1
	elif event.is_action_pressed(_new_InputName.MOVE_UP):
		y -= 1
	elif event.is_action_pressed(_new_InputName.MOVE_DOWN):
		y += 1
	else:
		return [false]
	return [true, x, y]


func _try_move(x: int, y: int) -> bool:
	# if not _ref_DungeonBoard_is_inside_dungeon.call_func(x, y):
	if not _ref_DungeonBoard.is_inside_dungeon(x, y):
		print("bump")
		return false
	elif _ref_DungeonBoard.has_sprite(_new_GroupName.WALL, x, y):
		print("wall")
		return false
	elif _ref_DungeonBoard.has_sprite(_new_GroupName.DWARF, x, y):
		return get_node(PC_ATTACK).try_attack(_new_GroupName.DWARF, x, y)
	else:
		_pc.position = _new_ConvertCoord.index_to_vector(x, y)
		return true
