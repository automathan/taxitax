extends Control

@onready var sfx = $AudioStreamPlayer
@onready var esc_menu = $NinePatchRect
@onready var shadow = $"../ColorRect"

@onready var header = $"../Header"
@onready var footer = $"../Footer"
@onready var crimes = $"../Crimes"

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('ui_cancel') and not Economy.is_game_over:
		get_tree().paused = not get_tree().paused
		sfx.pitch_scale = 1.2 if get_tree().paused else .8
		sfx.play()
		shadow.visible = get_tree().paused
		esc_menu.visible = get_tree().paused
		header.visible = not get_tree().paused
		footer.visible = not get_tree().paused
		crimes.visible = not get_tree().paused
