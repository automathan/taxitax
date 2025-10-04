extends Node

signal station_changed

@onready var player = $AudioStreamPlayer

@export var songs: Array[AudioStream]
@export var channel_names: Array[String]

var idx: int = 0

func _ready() -> void:
	idx = len(songs) - 2
	cycle_song()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('ui_accept'):
		cycle_song()

func cycle_song():
	idx = (idx + 1) % len(songs)
	player.stream = songs[idx]
	player.play(randf() * songs[idx].get_length())
	station_changed.emit()
