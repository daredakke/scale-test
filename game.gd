class_name Game
extends Node2D


enum Mode {
	WINDOW_ONE,
	WINDOW_TWO,
	FULLSCREEN,
}

var _current_mode: int = Mode.WINDOW_ONE
var _resolutions: Array[Vector2i] = [
	Vector2i(640, 360),
	Vector2i(1280, 720),
]


func _ready() -> void:
	_resize_screen(_current_mode)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		_current_mode += 1
		
		if _current_mode >= Mode.size():
			_current_mode = 0
		
		_resize_screen(_current_mode)


func _resize_screen(mode: int) -> void:
	match mode:
		0, 1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			ProjectSettings.set_setting("display/window/size/borderless", false)
			get_window().size = _resolutions[mode]
			get_window().move_to_center()
		2:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
