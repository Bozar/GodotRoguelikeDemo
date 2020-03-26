extends Node2D


var _ref_Schedule_end_turn: FuncRef


func _on_Schedule_turn_started(current_sprite: Sprite) -> void:
	if current_sprite.is_in_group("dwarf"):
		_ref_Schedule_end_turn.call_func()
