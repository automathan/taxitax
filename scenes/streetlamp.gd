extends RigidBody3D

@onready var sfx = $AudioStreamPlayer3D

func _ready() -> void:
	body_entered.connect(hit)

func hit(other):
	if other is Car:
		Economy.add_cash(-5, '[-$5] Destroyed street light')
		call_deferred('set_contact_monitor', false)
		sfx.pitch_scale = .3 + randf() * .3
		sfx.play()
