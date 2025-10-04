extends VehicleBody3D

var max_steer = 1
var engine_power = 500

func _physics_process(delta: float) -> void:
	steering = move_toward(steering, Input.get_axis('ui_right', 'ui_left') * max_steer, delta * 10)
	engine_force = Input.get_axis('ui_down', 'ui_up') * engine_power
