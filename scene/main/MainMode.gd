extends Node2D


const NODE_INIT: String = "InitWorld"
const NODE_PC_MOVE: String = "PCMove"
const NODE_NPC: String = "EnemyAI"
const NODE_SCHEDULE: String = "Schedule"
const NODE_DUNGEON: String = "DungeonBoard"

var _signal_name: String
var _func_name: String
var _var_name: String


func _ready() -> void:
	_set_signal()
	_set_node_ref()


func _set_signal() -> void:
	_signal_name = "sprite_created"
	_func_name = "_on_InitWorld_sprite_created"
	_connect(NODE_INIT, NODE_PC_MOVE)
	_connect(NODE_INIT, NODE_SCHEDULE)
	_connect(NODE_INIT, NODE_DUNGEON)

	_signal_name = "child_node_initialized"
	_func_name = "_on_InitWorld_child_node_initialized"
	_connect(NODE_INIT, NODE_PC_MOVE)

	_signal_name = "turn_started"
	_func_name = "_on_Schedule_turn_started"
	_connect(NODE_SCHEDULE, NODE_PC_MOVE)
	_connect(NODE_SCHEDULE, NODE_NPC)


func _connect(source_node: String, target_node: String) -> void:
	var __ = get_node(source_node).connect(_signal_name,
			get_node(target_node), _func_name)

func _set_node_ref() -> void:
	# get_node(NODE_PC_MOVE)._ref_DungeonBoard_is_inside_dungeon = funcref(
	# 		get_node(NODE_DUNGEON), "is_inside_dungeon")

	_var_name = "_ref_DungeonBoard"
	_ref(NODE_PC_MOVE, NODE_DUNGEON)

	_var_name = "_ref_Schedule"
	_ref(NODE_PC_MOVE, NODE_SCHEDULE)
	_ref(NODE_NPC, NODE_SCHEDULE)


func _ref(source_node: String, target_node: String) -> void:
	get_node(source_node)[_var_name] = get_node(target_node)
