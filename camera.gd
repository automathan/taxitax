extends Camera3D

@export var proxy: Node3D

func _physics_process(delta: float) -> void:
	global_position.x = proxy.global_position.x
	global_position.z = proxy.global_position.z
	global_rotation.y = proxy.global_rotation.y
