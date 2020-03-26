extends Node2D


const ConvertCoord := preload("res://library/ConvertCoord.gd")

var _get_coord: ConvertCoord = ConvertCoord.new()

var _ref_Schedule_end_turn: FuncRef
var _ref_DungeonBoard_is_inside_dungeon: FuncRef

var _pc: Sprite


func _ready() -> void:
	set_process_unhandled_input(false)


func _unhandled_input(event) -> void:
	var pos: Array = _get_coord.vector_to_array(_pc.position)
	var x: int = pos[0]
	var y: int = pos[1]

	if event.is_action_pressed("move_left"):
		x -= 1
	elif event.is_action_pressed("move_right"):
		x += 1
	elif event.is_action_pressed("move_up"):
		y -= 1
	elif event.is_action_pressed("move_down"):
		y += 1
	else:
		return

	if _ref_DungeonBoard_is_inside_dungeon.call_func(x, y):
		_pc.position = _get_coord.index_to_vector(x, y)
		_ref_Schedule_end_turn.call_func()
	else:
		print("bump")


func _on_InitWorld_sprite_created(new_sprite: Sprite) -> void:
	if new_sprite.name == "PC":
		_pc = new_sprite
		set_process_unhandled_input(true)


func _on_Schedule_turn_started(current_sprite: Sprite) -> void:
	if current_sprite.is_in_group("pc"):
		set_process_unhandled_input(true)
	else:
		set_process_unhandled_input(false)
