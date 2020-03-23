extends Node2D


func _ready() -> void:
	var __

	__ = $"InitWorld".connect("sprite_created", $"PCMove",
			"_on_InitWorld_sprite_created")
