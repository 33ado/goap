extends Goal
class_name HideGoal

func desired_state() -> Dictionary:
	return { "afraid": false, }

func is_valid() -> bool:
	return true

func get_priority() -> int:
	return 5
