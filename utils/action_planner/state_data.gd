extends Node
class_name StateData

var _state = {
	"has_wood": false,
}

func set_value(key, value):
	_state[key] = value

func get_value(key):
	return _state.get[key]
