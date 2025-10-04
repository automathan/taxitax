class_name Customer
extends Node3D

@onready var label = $Label3D
@onready var death_area = $DeathArea

var pickup_template = 'Picking Up\n[%s%s%s%s%s]'
var entering: bool
var enter_time: float = 0

func _ready() -> void:
	death_area.area_entered.connect(_death_area_entered)

func _death_area_entered(other: Area3D):
	var parent = other.get_parent()

	if parent is Car:
		print('KILLED')
		queue_free()

func pick_up():
	entering = true

func _physics_process(delta: float) -> void:
	if entering:
		enter_time += delta * 2
		label.text = pickup_template % generate_marker_array()
		if enter_time > 6:
			queue_free()

func generate_marker_array() -> Array:
	var markers = []
	for i in range(5):
		markers.push_back('x' if enter_time > i + 1 else '-')
	return markers
