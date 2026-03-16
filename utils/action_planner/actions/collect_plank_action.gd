extends Action
class_name CollectPlankAction

func is_valid() -> bool: 
	if Utils.get_elements("Plank").size() == 0:
		return false
		
	return true
	
func get_cost() -> int:
	var closest_tree = Utils.get_closest_element("Plank", actor)
	return int(closest_tree.global_position.distance_to(actor.global_position) / 7)

func get_preconditions() -> Dictionary:
	return {}

func reward() -> Dictionary:
	return { "has_wood": true }
	
func perform(delta) -> bool:
	var destination = Utils.get_closest_element("Plank", actor)
	if actor.move_to(destination.global_position  + Vector2(16, 16)) and destination.collect_plank(delta):
		destination.queue_free()
		return true 
		
	return false
