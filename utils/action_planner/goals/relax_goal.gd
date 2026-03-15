extends Goal
class_name RelaxGoal

func desired_state() -> Dictionary:
	return {}

func is_valid() -> bool:
	return true

func get_priority() -> int:
	return 1
