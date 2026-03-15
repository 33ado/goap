extends StaticBody2D
class_name FirTree

@onready var area2d = $Area2D
var _chop_time = 1.0
var _chop_timer = 0.0

func chop_tree(delta) -> bool:
	_chop_timer += delta
	return _chop_timer >= _chop_time
