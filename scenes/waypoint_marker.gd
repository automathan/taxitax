extends Node3D

@onready var sprite = $Sprite3D
@onready var area = $Area3D
@onready var sfx = $AudioStreamPlayer
@onready var car = $"../../Car"
@onready var dialogue = $"../../CanvasLayer/Footer/NinePatchRect"

@export var display_name: String

var active: bool = false
var reward: int = 0

func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.chain().tween_interval(2)
	tween.chain().tween_property(sprite, 'offset', Vector2(0, 4), .5)
	tween.chain().tween_property(sprite, 'offset', Vector2(0, 0), .5)
	tween.set_loops(0)

	area.area_entered.connect(_area_entered)
	sprite.modulate = Color.TRANSPARENT

func _area_entered(other: Area3D):
	if not active:
		return

	var parent = other.get_parent()

	if parent is Car:
		car_arrived()

func activate(new_reward: int):
	reward = new_reward
	active = true
	sprite.modulate = Color('ffd073')

func car_arrived():
	car.busy = false
	Economy.add_cash(reward)
	sfx.play()

	var tween = get_tree().create_tween()
	tween.chain().tween_property(sprite, 'modulate', Color.TRANSPARENT, 2)
	active = false
	dialogue.fade_out()
