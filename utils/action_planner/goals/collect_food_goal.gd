extends Goal
class_name CollectFoodGoal

func is_valid() -> bool:
	return state_data.get_value("hunger") < 75 and Utils.get_elements("Bush").size() != 0

func desired_state() -> Dictionary:
	return {
		"has_hunger": false,
	}

func get_priority() -> int:
	if state_data.get_value("hunger") < 50:
		return 2
	if state_data.get_value("hunger") < 75:
		return 4
	return 1
