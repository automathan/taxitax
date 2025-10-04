extends VehicleBody3D

var max_steer = 1
var engine_power = 600
@onready var sprite = $AnimatedSprite3D

func _ready() -> void:
	sprite.play()

func _physics_process(delta: float) -> void:
	steering = move_toward(steering, Input.get_axis('ui_right', 'ui_left') * max_steer, delta * 50)
	engine_force = Input.get_axis('ui_down', 'ui_up') * engine_power
	sprite.speed_scale = linear_velocity.length()
