extends Action
class_name HideAction

func is_valid() -> bool: 
	return true
	
func get_cost() -> int:
	return 1000

func get_preconditions() -> Dictionary:
	return {}

func reward() -> Dictionary:
	return { "afraid": false }
	
func perform(delta) -> bool:
	var destination = Utils.get_closest_element("Hideout", actor).global_position
	actor.move_to(destination)
	return false
