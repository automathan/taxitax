extends Node3D

func _ready() -> void:
	$CanvasLayer/Control/Button2.pressed.connect(func(): get_tree().quit())
	$CanvasLayer/Control/Button3.pressed.connect(toggle_fullscreen)

func toggle_fullscreen():
	if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_WINDOWED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		$CanvasLayer/Control/Button3.text = 'FULLSCREEN'
	elif DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		$CanvasLayer/Control/Button3.text = 'WINDOWED'
