extends Action
class_name ChopTreeAction

func is_valid() -> bool: 
	return true
	
func get_cost(state_data : StateData) -> int:
	return 1000

func get_preconditions() -> Dictionary:
	return {}

func reward() -> Dictionary:
	return { "has_wood": true }
	
func perform(actor, delta) -> bool:
	return false
