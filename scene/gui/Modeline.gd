extends Label


var _new_GroupName := preload("res://library/GroupName.gd").new()


func _ready() -> void:
	text = ""


func _on_Schedule_turn_ended(current_sprite: Sprite) -> void:
	if current_sprite.is_in_group(_new_GroupName.PC):
		text = ""


func _on_EnemyAI_enemy_warned(message: String) -> void:
	text = message
