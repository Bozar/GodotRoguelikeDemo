extends Node2D


var _dungeon := preload("res://library/DungeonSize.gd").new()


func is_inside_dungeon(x: int, y: int) -> bool:
	return (x > -1) and (x < _dungeon.MAX_X) \
			and (y > -1) and (y < _dungeon.MAX_Y)
