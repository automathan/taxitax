extends Node3D

@onready var sprite = $Sprite3D

func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.chain().tween_interval(2)
	tween.chain().tween_property(sprite, 'offset', Vector2(0, 4), .5)
	tween.chain().tween_property(sprite, 'offset', Vector2(0, 0), .5)
	tween.set_loops(0)
