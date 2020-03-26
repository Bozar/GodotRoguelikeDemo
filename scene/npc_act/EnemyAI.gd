extends Node2D


const Schedule := preload("res://scene/main/Schedule.gd")

var _ref_Schedule: Schedule


func _on_Schedule_turn_started(current_sprite: Sprite) -> void:
	if current_sprite.is_in_group("dwarf"):
		_ref_Schedule.end_turn()
