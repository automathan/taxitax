class_name Car
extends VehicleBody3D

var max_steer = 1
var engine_power = 600

@onready var area: Area3D = $EnterArea
@onready var sprite = $AnimatedSprite3D
@onready var proxy_point = $CameraProxy
@onready var engine_sfx = $AudioStreamPlayer3D

var busy: bool = false

func _ready() -> void:
	sprite.play()
	area.area_entered.connect(_area_entered)

func _area_entered(other: Area3D):
	var parent = other.get_parent()

	if parent is Customer:
		parent.pick_up()

func _physics_process(delta: float) -> void:
	steering = move_toward(steering, Input.get_axis('ui_right', 'ui_left') * max_steer, delta * 50)
	engine_force = Input.get_axis('ui_down', 'ui_up') * engine_power
	sprite.speed_scale = linear_velocity.length()
	engine_sfx.pitch_scale = .8 + linear_velocity.length() / 10
	engine_sfx.volume_db = -40 + linear_velocity.length() * 1.4
