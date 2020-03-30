extends "res://library/RootNodeTemplate.gd"


const NODE_INIT: String = "InitWorld"
const NODE_PC_MOVE: String = "PCMove"
const NODE_PC_ATTACK: String = "PCMove/PCAttack"
const NODE_NPC: String = "EnemyAI"
const NODE_SCHEDULE: String = "Schedule"
const NODE_DUNGEON: String = "DungeonBoard"
const NODE_REMOVE: String = "RemoveObject"

const SIGNAL_BIND: Array = [
	[
		"sprite_created", "_on_InitWorld_sprite_created",
		NODE_INIT,
		NODE_PC_MOVE, NODE_SCHEDULE, NODE_DUNGEON,
	],
	[
		"turn_started", "_on_Schedule_turn_started",
		NODE_SCHEDULE,
		NODE_PC_MOVE, NODE_NPC,
	],
	[
		"sprite_removed", "_on_RemoveObject_sprite_removed",
		NODE_REMOVE,
		NODE_DUNGEON, NODE_SCHEDULE,
	],
]

const NODE_REF: Array = [
	[
		"_ref_DungeonBoard",
		NODE_DUNGEON,
		NODE_PC_MOVE, NODE_PC_ATTACK, NODE_REMOVE,
	],
	[
		"_ref_Schedule",
		NODE_SCHEDULE,
		NODE_PC_MOVE, NODE_NPC,
	],
	[
		"_ref_RemoveObject",
		NODE_REMOVE,
		NODE_PC_ATTACK,
	],
]


func _init().(SIGNAL_BIND, NODE_REF) -> void:
	pass
