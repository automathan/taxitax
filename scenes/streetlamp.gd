extends RigidBody3D

func _ready() -> void:
	body_entered.connect(hit)

func hit(other):
	if other is Car:
		Economy.add_cash(-5)
		call_deferred('set_contact_monitor', false)
