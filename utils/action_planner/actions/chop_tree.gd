extends Action
class_name ChopTreeAction

func is_valid() -> bool: 
	if Utils.get_elements("FirTree").size() == 0:
		return false
		
	return true
	
func get_cost() -> int:
	var closest_tree = Utils.get_closest_element("FirTree", actor)
	return int(closest_tree.global_position.distance_to(actor.global_position) / 7)

func get_preconditions() -> Dictionary:
	return {}

func reward() -> Dictionary:
	return { "has_wood": true }
	
func perform(delta) -> bool:
	var destination = Utils.get_closest_element("FirTree", actor)
	if actor.move_to(destination.global_position  + Vector2(16, 32)) and destination.chop_tree(delta):
		destination.queue_free()
		return true 
		
	return false
