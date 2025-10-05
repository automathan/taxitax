extends Node

@export var menu_scene: PackedScene
@export var game_scene: PackedScene

var menu: Node
var game: Node

func _ready() -> void:
	menu = menu_scene.instantiate()
	add_child(menu)

func load_game():
	if menu:
		menu.queue_free()

	if game:
		game.tree_exited.connect(func():
			var new_game = game_scene.instantiate()
			add_child(new_game)
			game = new_game
		)
		game.queue_free()
		remove_child(game)
	else:
		var new_game = game_scene.instantiate()
		add_child(new_game)
		game = new_game
