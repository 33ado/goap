extends Node
class_name Goal

func desired_state() -> Dictionary:
	return {}

func is_valid() -> bool:
	return true

func get_priority() -> int:
	return 1

func is_satisfied(state_data: StateData) -> bool:
	for key in state_data:
		if state_data.get_value(key) != desired_state()[key]:
			return false
			
	return true
