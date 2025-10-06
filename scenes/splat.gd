extends Node3D

@onready var sprite = $AnimatedSprite3D
@onready var sfx = $AudioStreamPlayer3D

func _ready() -> void:
	sprite.animation_looped.connect(queue_free)
	sprite.play()
	sfx.pitch_scale = .9 + randf() * .5
	sfx.play()
