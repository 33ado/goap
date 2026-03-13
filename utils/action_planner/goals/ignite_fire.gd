extends Goal
class_name IgniteFireGoal

func desired_state() -> Dictionary:
	return { "has_wood": true, }

func is_valid() -> bool:
	return true

func get_priority() -> int:
	return 1
