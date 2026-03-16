extends StaticBody2D
class_name Plank

var _collect_time = 1.0
var _collect_timer = 0.0

func collect_plank(delta) -> bool:
	_collect_timer += delta
	return _collect_timer >= _collect_time
