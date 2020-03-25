extends Node2D


var ref_end_turn: FuncRef


func _on_Schedule_turn_started(current_sprite: Sprite) -> void:
	if current_sprite.is_in_group("dwarf"):
		ref_end_turn.call_func()
