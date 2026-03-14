extends Action
class_name CollectBerryAction

func is_valid() -> bool: 
	return true
	
func get_cost() -> int:
	return 1000

func get_preconditions() -> Dictionary:
	return {}

func reward() -> Dictionary:
	return {}
	
func perform(delta) -> bool:
	return false
