extends Control

@onready var sfx = $AudioStreamPlayer
@onready var esc_menu = $NinePatchRect
@onready var shadow = $"../ColorRect"

@onready var header = $"../Header"
@onready var footer = $"../Footer"
@onready var crimes = $"../Crimes"

func _ready() -> void:
	$NinePatchRect/Button.pressed.connect(toggle_escape)
	$NinePatchRect/Button3.pressed.connect(func(): get_tree().quit())
	$NinePatchRect/Button2.pressed.connect(toggle_fullscreen)

func toggle_fullscreen():
	if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_WINDOWED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		$NinePatchRect/Button2.text = 'FULLSCREEN'
	elif DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		$NinePatchRect/Button2.text = 'WINDOWED'

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('ui_cancel'):
		toggle_escape()

func toggle_escape():
	if not Economy.is_game_over:
		get_tree().paused = not get_tree().paused
		sfx.pitch_scale = 1.2 if get_tree().paused else .8
		sfx.play()
		shadow.visible = get_tree().paused
		esc_menu.visible = get_tree().paused
		header.visible = not get_tree().paused
		footer.visible = not get_tree().paused
		crimes.visible = not get_tree().paused
