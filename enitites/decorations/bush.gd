extends StaticBody2D
class_name Bush

@onready var area2d = $Area2D

var _collect_time = 1.0
var _collct_timer = 0.0

func collect_berrys(delta) -> bool:
	_collct_timer += delta
	return _collct_timer >= _collect_time
