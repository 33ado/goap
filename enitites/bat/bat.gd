extends CharacterBody2D
class_name Bat

@export var min_time_dir_change : float = 2.0
@export var max_time_dir_change : float = 5.0

@onready var sprite = $AnimatedSprite2D
var current_direction : Vector2
var change_timer : float
const SPEED = 50.0

func _ready() -> void:
	change_timer = randf_range(min_time_dir_change, max_time_dir_change)
	current_direction = _choose_random_direction()
	sprite.play("default")

func _physics_process(delta: float) -> void:
	change_timer -= delta
	if change_timer <= 0:
		current_direction = _choose_random_direction()
		change_timer = randf_range(min_time_dir_change, max_time_dir_change)
	velocity = SPEED * current_direction
	move_and_slide()
	
func _choose_random_direction():
	return Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0))

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	change_timer = randf_range(min_time_dir_change, max_time_dir_change)
	current_direction = current_direction * -1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Fox:
		body.state_data.set_value("afraid", true)
