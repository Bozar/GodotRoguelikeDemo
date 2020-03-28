extends Node2D


const DungeonBoard := preload("res://scene/main/DungeonBoard.gd")
const Schedule := preload("res://scene/main/Schedule.gd")

var _ref_DungeonBoard: DungeonBoard
var _ref_Schedule: Schedule


func try_attack(group_name: String, x: int, y: int) -> bool:
	print("attack: {0}: {1}, {2}".format([group_name, x, y]))
	return false
