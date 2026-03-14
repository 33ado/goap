extends Node
class_name Goal

var actor : Node2D
var state_data : StateData

func desired_state() -> Dictionary:
	return {}

func is_valid() -> bool:
	return true

func get_priority() -> int:
	return 1
