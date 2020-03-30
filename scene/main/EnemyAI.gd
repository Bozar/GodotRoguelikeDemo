extends Node2D


const Schedule := preload("res://scene/main/Schedule.gd")

var _ref_Schedule: Schedule

var _new_GroupName := preload("res://library/GroupName.gd").new()


func _on_Schedule_turn_started(current_sprite: Sprite) -> void:
	if current_sprite.is_in_group(_new_GroupName.DWARF):
		_ref_Schedule.end_turn()
