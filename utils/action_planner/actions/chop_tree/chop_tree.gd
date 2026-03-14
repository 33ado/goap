extends Action
class_name ChopTreeAction

func is_valid() -> bool: 
	if Utils.get_elements("FirTree").size() == 0:
		return false
		
	return true
	
func get_cost() -> int:
	print(Utils.get_closest_element("FirTree", actor))
	if Utils.get_closest_element("FirTree", actor):
		pass
	return 1000

func get_preconditions() -> Dictionary:
	return {}

func reward() -> Dictionary:
	return { "has_wood": true }
	
func perform(delta) -> bool:
	return false
