class_name Fish
extends CharacterBody2D


const ANGULAR_SPEED: float = TAU * 2

var _target_angle: float


func _process(delta: float) -> void:
	# Rotation
	_target_angle = (get_global_mouse_position() - position).angle()
	var angle_diff: float = wrapf(_target_angle - rotation, -PI, PI)
	rotation += clamp(ANGULAR_SPEED * delta, 0, abs(angle_diff)) * sign(angle_diff)
