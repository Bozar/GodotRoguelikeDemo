extends Node2D


var _actors: Array = [null]
var _pointer: int = 0


func _on_InitWorld_sprite_created(new_sprite: Sprite) -> void:
	if new_sprite.is_in_group("pc"):
		_actors[0] = new_sprite
	elif new_sprite.is_in_group("dwarf"):
		_actors.append(new_sprite)


func end_turn() -> void:
	_goto_next()
	print(_get_current().name)
	# Emit a signal.


func _get_current() -> Sprite:
	return _actors[_pointer] as Sprite


func _goto_next() -> void:
	_pointer += 1

	if _pointer > len(_actors) - 1:
		_pointer = 0
