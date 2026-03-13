extends Node
class_name ActionPlanner

@onready var parent := get_parent()
var actions : Array = []
var goals : Array = []
var state_data: StateData

var _current_plan : Array
var _current_plan_step: int 
var current_goal : Goal

func _ready() -> void:
	recursive_search(self)
	
func recursive_search(node: Node) -> void:
	for child in node.get_children():
		if child is Goal:
			goals.append(child)
		if child is Action:
			actions.append(child)
		if child is StateData:
			state_data = child
		
		recursive_search(child)
		
func _process(delta: float) -> void:
	var goal = _get_best_goal()
	
	if not current_goal or goal != current_goal:
		current_goal = goal
		_current_plan_step = 0
		_current_plan = plan()
	else:
		_follow_plan(delta)
	

func plan():
	print("Goal: %s" % current_goal.get_class())
	var desired_state = current_goal.desired_state().duplicate()
	
	if desired_state.is_empty():
		return []
		
	return _find_best_plan()
	
func _find_best_plan() -> Array:
	var desired_state = current_goal.desired_state().duplicate()
	var root = {
		"action": current_goal,
		"state": desired_state,
		"children": [],
	}
	
	if _build_plans(root):
		var plans = _transform_tree_into_array(root)
		return _get_cheapest_plan(plans)
	
	return []
	
func _build_plans(step : Dictionary) -> bool:
	var has_followup := false
	
	var state = step.state.duplicate()
	for s in state:
		if state[s] == state_data.get(s):
			state.erase(s)
			
	if state.is_empty():
		return true
	
	for action in actions:
		if not action.is_valid():
			continue
		
		var should_use_action = false
		var reward = action.reward()
		var desired_state = state.duplicate()

		for s in desired_state:
			if desired_state[s] == reward.get(s):
				desired_state.erase(s)
				should_use_action = true
				
		if should_use_action:
			var preconditions = action.get_preconditions()
			for p in preconditions:
				desired_state[p] = preconditions[p]

			var s = {
				"action": action,
				"state": desired_state,
				"children": []
			}
			
			if desired_state.is_empty() or _build_plans(s):
				step.children.push_back(s)
				has_followup = true
	
	return has_followup

func _get_cheapest_plan(plans : Array) -> Array:
	var best_plan
	for p in plans:
		_print_plan(p)
		if best_plan == null or p.cost < best_plan.cost:
			best_plan = p
	return best_plan.actions
	
func _follow_plan(delta : float):
	if _current_plan.size() == 0:
		return
		
	var is_step_complete = _current_plan[_current_plan_step].perform(parent, delta)
	if is_step_complete and _current_plan_step < _current_plan.size() - 1:
		_current_plan_step += 1

func _transform_tree_into_array(p):
	var plans = []

	if p.children.size() == 0:
		plans.push_back({ "actions": [p.action], "cost": p.action.get_cost(state_data) })
		return plans

	for c in p.children:
		for child_plan in _transform_tree_into_array(c):
			if p.action.has_method("get_cost"):
				child_plan.actions.push_back(p.action)
				child_plan.cost += p.action.get_cost(state_data)
			plans.push_back(child_plan)
	return plans

func _get_best_goal() -> Goal:
	var highest_priority : Goal
	
	for goal in goals:
		if goal.is_valid() and (not highest_priority or goal.get_priority() > highest_priority.get_priority()):
			highest_priority = goal
	
	return highest_priority

func _print_plan(plan):
	var ac = []
	for a in plan.actions:
		ac.push_back(a.get_class())
	print({"cost": plan.cost, "actions": ac})
