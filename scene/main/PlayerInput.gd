extends Node2D


func _unhandled_input(event):
	if event.is_action_pressed("move_left"):
		print("move left")
	elif event.is_action_pressed("move_right"):
		print("move right")
	elif event.is_action_pressed("move_up"):
		print("move up")
	elif event.is_action_pressed("move_down"):
		print("move down")
