extends CharacterBody2D

const SPEED = 75.0
const CAMPFIRE_SCENE = preload("res://enitites/decorations/camp_fire.tscn")
@onready var animation_tree = $AnimationTree
@onready var state_data = $ActionPlanner/StateData
@onready var hunger_label = $HungerLabel

func _ready() -> void:
	animation_tree.active = true

func _process(delta: float) -> void:
	if Utils.get_elements("CampFire").size() == 0:
		state_data.set_value("fire_ignited", false)
	
	if state_data.get_value("has_hunger"):
		state_data.set_value("hunger", state_data.get_value("hunger") - delta)
	else:
		state_data.set_value("hunger", 100)
		state_data.set_value("has_hunger", true)
	hunger_label.text = "Hunger: " + str(int(state_data.get_value("hunger")))
	
func _physics_process(delta: float) -> void:
	if velocity != Vector2.ZERO:
		_update_blend_positions(Vector2(clamp(velocity.x, -1.0, 1.0), clamp(velocity.y, -1.0, 1.0)))
	
	move_and_slide()

func _update_blend_positions(direction_vector: Vector2) -> void:
	animation_tree.set("parameters/StateMachine/MoveState/RunState/blend_position", direction_vector)
	animation_tree.set("parameters/StateMachine/MoveState/IdleState/blend_position", direction_vector)

func move_to(pos: Vector2) -> bool:
	var dist = global_position.distance_to(pos)
	if dist < 50:
		velocity = Vector2.ZERO
		return true
		
	var dir = global_position.direction_to(pos)
	velocity = dir * SPEED
	return false
	
func set_campfire(pos: Vector2) -> bool:
	if move_to(pos):
		var campfire = CAMPFIRE_SCENE.instantiate()
		campfire.global_position = pos
		get_parent().add_child(campfire)
		return true
		
	return false
