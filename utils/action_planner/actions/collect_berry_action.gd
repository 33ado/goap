extends Action
class_name CollectBerryAction

func is_valid() -> bool: 
	return true
	
func get_cost() -> int:
	return 1000

func get_preconditions() -> Dictionary:
	return {}

func reward() -> Dictionary:
	return { "has_hunger": false }
	
func perform(delta) -> bool:
	var destination = Utils.get_closest_element("Bush", actor)
	if actor.move_to(destination.global_position) and destination.collect_berrys(delta):
		destination.queue_free()
		return true
		
	return false
