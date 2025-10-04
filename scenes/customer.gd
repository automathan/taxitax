class_name Customer
extends Node3D

@onready var label = $Label3D
@onready var death_area = $DeathArea
@onready var sprite = $Sprite3D
@onready var sfx = $AudioStreamPlayer

@export var waypoints: Node3D
@export var car: Node3D
@export var dialogue: Control
@export var sprite_variants: Array[Texture2D]

var pickup_template = 'Picking Up\n[%s%s%s%s%s]'
var entering: bool = false
var enter_time: float = 0
var fading: bool = false
var waypoint

func _ready() -> void:
	death_area.area_entered.connect(_death_area_entered)
	sprite.texture = sprite_variants[randi() % len(sprite_variants)]
	sprite.flip_h = (randi() % 2) == 0

func _death_area_entered(other: Area3D):
	var parent = other.get_parent()

	if parent is Car:
		print('KILLED')
		Economy.add_cash(-40)
		queue_free()

func pick_up():
	if not car.busy:
		entering = true

func _physics_process(delta: float) -> void:
	if not fading and car and car.busy:
		entering = false
		label.text = 'TAXI!'
		enter_time = 0

	if entering and not fading:
		enter_time += delta * 3
		label.text = pickup_template % generate_marker_array()

		if enter_time > 6:
			enter_taxi()

func enter_taxi():
	waypoint = waypoints.get_random_waypoint()
	label.text = ''
	sfx.play()
	fade_out()
	entering = false
	waypoint.activate()
	dialogue.set_content('Take me to %s' % waypoint.display_name)
	car.busy = true

func fade_out():
	fading = true
	var tween = get_tree().create_tween()
	tween.chain().tween_property(sprite, 'modulate', Color.TRANSPARENT, 1)
	tween.chain().tween_callback(queue_free)

func generate_marker_array() -> Array:
	var markers = []
	for i in range(5):
		markers.push_back('x' if enter_time > i + 1 else '-')
	return markers
