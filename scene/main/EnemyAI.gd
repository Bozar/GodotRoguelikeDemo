extends Node2D


var _ref_Schedule := preload("res://scene/main/Schedule.gd").new()
var _group_name := preload("res://library/GroupName.gd").new()


func _on_Schedule_turn_started(current_sprite: Sprite) -> void:
	if current_sprite.is_in_group(_group_name.DWARF):
		_ref_Schedule.end_turn()
