extends Node2D


var _actors: Array = [null]


func _on_InitWorld_sprite_created(new_sprite: Sprite) -> void:
	if new_sprite.is_in_group("pc"):
		_actors[0] = new_sprite
	elif new_sprite.is_in_group("dwarf"):
		_actors.append(new_sprite)
