extends Goal
class_name IgniteFireGoal

func desired_state() -> Dictionary:
	return { "fire_ignited": true, }

func is_valid() -> bool:
	return Utils.get_elements("CampFire").size() == 0

func get_priority() -> int:
	return 4
