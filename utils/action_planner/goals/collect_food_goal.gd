extends Goal
class_name CollectFoodGoal

func desired_state() -> Dictionary:
	return {
		"hunger": 100,
	}

func get_priority() -> int:
	if state_data.get_value("hunger") < 50:
		return 2
	if state_data.get_value("hunger") < 75:
		return 4
	return 1
