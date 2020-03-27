extends Node2D


var _ref_Schedule := preload("res://scene/main/Schedule.gd").new()


func _on_Schedule_turn_started(current_sprite: Sprite) -> void:
	if current_sprite.is_in_group("dwarf"):
		_ref_Schedule.end_turn()
