extends Control

@onready var sfx = $AudioStreamPlayer

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('ui_cancel'):
		get_tree().paused = not get_tree().paused
		sfx.pitch_scale = 1.2 if get_tree().paused else .8
		sfx.play()
