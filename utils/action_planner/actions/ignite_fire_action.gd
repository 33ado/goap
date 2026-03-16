extends Action
class_name IgniteFireAction

func is_valid() -> bool: 
	return true
	
func get_cost() -> int:
	return 1000

func get_preconditions() -> Dictionary:
	return { "has_wood": true }

func reward() -> Dictionary:
	return { "fire_ignited": true, "has_wood": false }
	
func perform(delta) -> bool:
	return actor.set_campfire(Vector2(100, 100))
