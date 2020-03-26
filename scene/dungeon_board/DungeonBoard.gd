extends Node2D


const DungeonSize := preload("res://library/DungeonSize.gd")

var _dungeon: DungeonSize = DungeonSize.new()


func is_inside_dungeon(x: int, y: int) -> bool:
	return (x > -1) and (x < _dungeon.MAX_X) \
			and (y > -1) and (y < _dungeon.MAX_Y)
