extends Node2D


const Schedule := preload("res://scene/main/Schedule.gd")

var _group_name := preload("res://library/GroupName.gd").new()

var _ref_Schedule: Schedule


func _on_Schedule_turn_started(current_sprite: Sprite) -> void:
	if current_sprite.is_in_group(_group_name.DWARF):
		_ref_Schedule.end_turn()
