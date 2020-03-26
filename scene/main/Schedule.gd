extends Node2D


signal turn_started(current_sprite)

var _actors: Array = [null]
var _pointer: int = 0
var _counter: int = 0


func _on_InitWorld_sprite_created(new_sprite: Sprite) -> void:
	if new_sprite.is_in_group("pc"):
		_actors[0] = new_sprite
	elif new_sprite.is_in_group("dwarf"):
		_actors.append(new_sprite)


func end_turn() -> void:
	_goto_next()

	# Remove this block and _counter later. Count turns via GUI.
	if _get_current().is_in_group("pc"):
		_counter += 1
		print("Turn: {0}".format([_counter]))

	emit_signal("turn_started", _get_current())


func _get_current() -> Sprite:
	return _actors[_pointer] as Sprite


func _goto_next() -> void:
	_pointer += 1

	if _pointer > len(_actors) - 1:
		_pointer = 0
