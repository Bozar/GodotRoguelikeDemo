extends Node2D


const DungeonBoard := preload("res://scene/main/DungeonBoard.gd")
const RemoveObject := preload("res://scene/main/RemoveObject.gd")

var _ref_DungeonBoard: DungeonBoard
var _ref_RemoveObject: RemoveObject


func try_attack(group_name: String, x: int, y: int) -> bool:
	if _ref_DungeonBoard.has_sprite(group_name, x, y):
		_ref_RemoveObject.remove(group_name, x, y)
		print("kill dwarf")
		return true
	return false
