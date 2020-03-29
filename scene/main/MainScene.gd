extends "res://library/RootNodeTemplate.gd"

const PATH_TO_SELF = "/root/MainScene/"

const NODE_INIT: String = "InitWorld"
const NODE_PC_MOVE: String = "PCMove"
const NODE_NPC: String = "EnemyAI"
const NODE_SCHEDULE: String = "Schedule"
const NODE_DUNGEON: String = "DungeonBoard"

const SIGNAL_BIND: Array = [
	[
		"sprite_created", "_on_InitWorld_sprite_created",
		NODE_INIT,
		NODE_PC_MOVE, NODE_SCHEDULE, NODE_DUNGEON,
	],
	[
		"child_node_initialized", "_on_InitWorld_child_node_initialized",
		NODE_INIT,
		NODE_PC_MOVE,
	],
	[
		"turn_started", "_on_Schedule_turn_started",
		NODE_SCHEDULE,
		NODE_PC_MOVE, NODE_NPC,
	],
]

const NODE_REF: Array = [
	[
		"_ref_DungeonBoard",
		NODE_DUNGEON,
		NODE_PC_MOVE,
	],
	[
		"_ref_Schedule",
		NODE_SCHEDULE,
		NODE_PC_MOVE, NODE_NPC,
	],
]


func _init().(PATH_TO_SELF, SIGNAL_BIND, NODE_REF) -> void:
	pass
