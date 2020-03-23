extends Node2D


var _pc: Sprite


func _unhandled_input(event):
	if event.is_action_pressed("move_left"):
		print("move left")
	elif event.is_action_pressed("move_right"):
		print("move right")
	elif event.is_action_pressed("move_up"):
		print("move up")
	elif event.is_action_pressed("move_down"):
		print("move down")


func _on_InitWorld_sprite_created(new_sprite: Sprite) -> void:
	if new_sprite.name == "PC":
		_pc = new_sprite
