extends Node3D

@onready var death_area = $DeathArea
@onready var sprite = $Sprite3D

@export var splat_scene: PackedScene

var path

func _ready() -> void:
	death_area.area_entered.connect(_death_area_entered)

	var tween = get_tree().create_tween()
	tween.chain().tween_interval(.8)
	tween.chain().tween_property(sprite, 'offset', Vector2(0, 1), .2)
	tween.chain().tween_property(sprite, 'offset', Vector2(0, 0), .2)
	tween.set_loops(0)

	var parent = get_parent()
	if parent is PathFollow3D:
		path = parent
		path.progress = randi() * 10

func _physics_process(delta: float) -> void:
	if path:
		path.progress += delta * .2

func _death_area_entered(other: Area3D):
	var parent = other.get_parent()

	if parent is Car:
		die()

func die():
	Economy.add_cash(-100, '[-$100] Elderly murder')
	var splat = splat_scene.instantiate()
	get_parent().add_child(splat)
	splat.global_position = global_position
	queue_free()
