class_name Customer
extends Node3D

@onready var label = $Label3D
@onready var death_area = $DeathArea
@onready var sprite = $Sprite3D
@onready var sfx = $AudioStreamPlayer

@export var sprite_variants: Array[Texture2D]

var pickup_template = 'Picking Up\n[%s%s%s%s%s]'
var entering: bool = false
var enter_time: float = 0
var fading: bool = false

func _ready() -> void:
	death_area.area_entered.connect(_death_area_entered)
	sprite.texture = sprite_variants[randi() % len(sprite_variants)]
	sprite.flip_h = (randi() % 2) == 0

func _death_area_entered(other: Area3D):
	var parent = other.get_parent()

	if parent is Car:
		print('KILLED')
		queue_free()

func pick_up():
	entering = true

func _physics_process(delta: float) -> void:
	if entering and not fading:
		enter_time += delta * 2
		label.text = pickup_template % generate_marker_array()

		if enter_time > 6:
			label.text = ''
			sfx.play()
			fade_out()
			entering = false

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
