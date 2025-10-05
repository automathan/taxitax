extends Control

@onready var content = $NinePatchRect
@onready var sfx = $AudioStreamPlayer

@onready var shadow = $"../ColorRect"
@onready var header = $"../Header"
@onready var footer = $"../Footer"
@onready var crimes = $"../Crimes"

func _ready() -> void:
	Economy.game_over.connect(game_over)
	$NinePatchRect/Button3.pressed.connect(func(): get_tree().quit())

func game_over():
	get_tree().paused = true
	sfx.play()
	visible = true
	shadow.visible = true
	header.visible = false
	footer.visible = false
	crimes.visible = false
