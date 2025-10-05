extends RigidBody3D

@onready var sfx = $AudioStreamPlayer3D

func _ready() -> void:
	body_entered.connect(hit)

func hit(other):
	if other is Car:
		Economy.add_cash(-10, '[-$10] Unblocking the road')
		call_deferred('set_contact_monitor', false)
		sfx.pitch_scale = .2 + randf() * .1
		sfx.play()
