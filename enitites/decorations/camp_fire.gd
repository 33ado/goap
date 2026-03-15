extends StaticBody2D
class_name CampFire

@onready var sprite = $Sprite2D
@onready var timer = $Timer
@onready var area2d = $Area2D
@onready var label = $Label

func _process(delta: float) -> void:
	label.text = str(int(timer.time_left))

func _on_timer_timeout() -> void:
	queue_free()
	
