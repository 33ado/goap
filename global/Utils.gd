extends Node

var _elements : Array = []

func get_elements(element_class) -> Array:
	print(get_all_elements(get_tree().root))
	return get_all_elements(get_tree().root).filter(func(n):
		return # n.is_class(element_class)
	)
	
func get_all_elements(root):
	
	
func get_closest_element(element_class: String, actor : Node2D) -> Node:
	var elements = get_elements(element_class)
	if elements.is_empty():
		return null
		
	return elements.min_by(func(e): return e.global_position.distance_to(actor.global_position))
