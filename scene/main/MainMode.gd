extends Node2D


const NODE_INIT: String = "InitWorld"
const NODE_PC: String = "PCMove"
const NODE_NPC: String = "EnemyAI"
const NODE_SCHEDULE: String = "Schedule"


func _ready() -> void:
	_set_signal()
	_set_funcref()


func _set_signal() -> void:
	var __

	var signal_sprite: String = "sprite_created"
	var func_sprite: String = "_on_InitWorld_sprite_created"

	__ = get_node(NODE_INIT).connect(signal_sprite, get_node(NODE_PC),
			func_sprite)
	__ = get_node(NODE_INIT).connect(signal_sprite, get_node(NODE_SCHEDULE),
			func_sprite)

	var signal_turn: String = "turn_started"
	var func_turn: String = "_on_Schedule_turn_started"

	__ = get_node(NODE_SCHEDULE).connect(signal_turn, get_node(NODE_PC),
			func_turn)
	__ = get_node(NODE_SCHEDULE).connect(signal_turn, get_node(NODE_NPC),
			func_turn)


func _set_funcref() -> void:
	var func_turn: String = "end_turn"

	get_node(NODE_PC).ref_end_turn = funcref(get_node(NODE_SCHEDULE), func_turn)
	get_node(NODE_NPC).ref_end_turn = funcref(get_node(NODE_SCHEDULE),
			func_turn)
