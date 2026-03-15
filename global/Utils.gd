extends Node

var _elements : Array = []

func get_elements(element_class) -> Array:
	return get_all_nodes_in_tree().filter(func(n):
		return is_node_of_class(n, element_class)
	)
	
func is_node_of_class(node: Node, class_string: String) -> bool:
	if node.get_script():
		if node.get_script().get_global_name() == class_string:
			return true
	return node.is_class(class_string)
	
func get_all_nodes_in_tree(root_node = get_tree().root) -> Array:
	var all_nodes = []
	all_nodes.append(root_node)
	for child in root_node.get_children():
		all_nodes.append_array(get_all_nodes_in_tree(child))
	return all_nodes
	
func get_closest_element(element_class: String, actor : Node2D) -> Node:
	var elements = get_elements(element_class)
	if elements.is_empty():
		return null
	
	elements.sort_custom(func(a, b):
		return a.position.distance_to(actor.global_position) < b.position.distance_to(actor.global_position)
	)
	return elements[0]
