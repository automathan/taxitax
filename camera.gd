extends Camera3D

@export var car: Node3D

var proxy: Node3D

func _ready() -> void:
	proxy = car.proxy_point

func _physics_process(_delta: float) -> void:
	global_position.x = proxy.global_position.x
	global_position.z = proxy.global_position.z
	global_rotation.y = proxy.global_rotation.y
