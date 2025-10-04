extends Node3D

func get_random_waypoint():
	var children = get_children()
	return children[randi() % len(children)]
