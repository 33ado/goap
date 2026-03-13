extends CharacterBody2D

const SPEED = 300.0
@onready var animation_tree = $AnimationTree

func _ready() -> void:
	animation_tree.active = true

func _physics_process(delta: float) -> void:
	if velocity != Vector2.ZERO:
		_update_blend_positions(Vector2(clamp(velocity.x, -1.0, 1.0), clamp(velocity.y, -1.0, 1.0)))
	
	move_and_slide()

func _update_blend_positions(direction_vector: Vector2) -> void:
	animation_tree.set("parameters/StateMachine/MoveState/RunState/blend_position", direction_vector)
	animation_tree.set("parameters/StateMachine/MoveState/IdleState/blend_position", direction_vector)
