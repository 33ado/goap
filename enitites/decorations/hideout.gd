extends Node2D
class_name Hideout

@onready var timer = $Timer
var actor : Node2D

func _on_timer_timeout() -> void:
	actor.state_data.set_value("afraid", false)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Fox:
		actor = body
		timer.start()
