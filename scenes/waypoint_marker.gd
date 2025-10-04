extends Node3D

@onready var sprite = $Sprite3D
@onready var area = $Area3D

func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.chain().tween_interval(2)
	tween.chain().tween_property(sprite, 'offset', Vector2(0, 4), .5)
	tween.chain().tween_property(sprite, 'offset', Vector2(0, 0), .5)
	tween.set_loops(0)

	area.area_entered.connect(_area_entered)

func _area_entered(other: Area3D):
	var parent = other.get_parent()

	if parent is Car:
		car_arrived()

func car_arrived():
	var tween = get_tree().create_tween()
	tween.chain().tween_property(sprite, 'modulate', Color.TRANSPARENT, 2)
	tween.chain().tween_callback(queue_free)
