extends Node3D

@onready var timer = $Timer

@export var customer_scene: PackedScene

@export var waypoints: Node3D
@export var car: Node3D
@export var dialogue: Control

var spawn_points: Dictionary[Vector3, Node3D]

func _ready() -> void:
	for child in get_children():
		if child is Customer:
			spawn_points.set(child.global_position, child)

	timer.timeout.connect(try_spawn)

func try_spawn():
	for key in spawn_points:
		if not spawn_points[key]:
			if randi() % 60 != 0:
				continue

			var customer = customer_scene.instantiate()
			customer.car = car
			customer.waypoints = waypoints
			customer.dialogue = dialogue

			add_child(customer)
			customer.global_position = key
			spawn_points[key] = customer
