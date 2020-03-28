extends Node2D


const NODE_INIT: String = "InitWorld"
const NODE_PC_MOVE: String = "PCMove"
const NODE_PC_ATTACK: String = "PCMove/PCAttack"
const NODE_NPC: String = "EnemyAI"
const NODE_SCHEDULE: String = "Schedule"
const NODE_DUNGEON: String = "DungeonBoard"


func _ready() -> void:
	_set_signal()
	_set_node_ref()


func _set_signal() -> void:
	var __

	var signal_sprite: String = "sprite_created"
	var func_sprite: String = "_on_InitWorld_sprite_created"

	__ = get_node(NODE_INIT).connect(signal_sprite, get_node(NODE_PC_MOVE),
			func_sprite)
	__ = get_node(NODE_INIT).connect(signal_sprite, get_node(NODE_SCHEDULE),
			func_sprite)
	__ = get_node(NODE_INIT).connect(signal_sprite, get_node(NODE_DUNGEON),
			func_sprite)

	var signal_turn: String = "turn_started"
	var func_turn: String = "_on_Schedule_turn_started"

	__ = get_node(NODE_SCHEDULE).connect(signal_turn, get_node(NODE_PC_MOVE),
			func_turn)
	__ = get_node(NODE_SCHEDULE).connect(signal_turn, get_node(NODE_NPC),
			func_turn)


func _set_node_ref() -> void:
	# var func_inside: String = "is_inside_dungeon"

	# get_node(NODE_PC_MOVE)._ref_DungeonBoard_is_inside_dungeon = funcref(
	# 		get_node(NODE_DUNGEON), func_inside)

	get_node(NODE_PC_MOVE)._ref_DungeonBoard = get_node(NODE_DUNGEON)
	get_node(NODE_PC_ATTACK)._ref_DungeonBoard = get_node(NODE_DUNGEON)

	get_node(NODE_PC_MOVE)._ref_Schedule = get_node(NODE_SCHEDULE)
	get_node(NODE_PC_ATTACK)._ref_Schedule = get_node(NODE_SCHEDULE)
	get_node(NODE_NPC)._ref_Schedule = get_node(NODE_SCHEDULE)
