extends Node

func get_elements(element_class) -> Array:
	return get_tree().root.get_children().filter(func(n):
		return n.is_class(element_class)
	)
	
func get_closest_element(element_class: String, blackboard : Dictionary) -> Node:
	var elements = get_elements(element_class)
	if elements.is_empty():
		return null
		
	return elements.min_by(func(e): return e.global_position.distance_to(blackboard.global_position))
	

func dicts_match_subset(dict1: Dictionary, dict2: Dictionary) -> bool:
	for key in dict1.keys():
		if key in dict2 and dict1[key] != dict2[key]:
			return false
	return true
