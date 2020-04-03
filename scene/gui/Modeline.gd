extends Label


var _new_GroupName := preload("res://library/GroupName.gd").new()
var _has_text: bool = false


func _ready() -> void:
	text = ""


func _on_Schedule_turn_started(current_sprite: Sprite) -> void:
	if current_sprite.is_in_group(_new_GroupName.PC):
		_try_clear_text()


func _on_Schedule_turn_ended(current_sprite: Sprite) -> void:
	if current_sprite.is_in_group(_new_GroupName.PC):
		_try_clear_text()


func _on_EnemyAI_enemy_warned(message: String) -> void:
	_set_text(message)


func _on_PCMove_pc_moved(message: String) -> void:
	_set_text(message)


func _on_PCAttack_pc_attacked(message: String) -> void:
	_set_text(message)


func _set_text(message: String) -> void:
	text = message
	_has_text = true


func _try_clear_text() -> void:
	if _has_text:
		_has_text = false
	else:
		text = ""
