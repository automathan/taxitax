extends RichTextLabel

@export var radio: Node

var tween: Tween

func _ready() -> void:
	modulate = Color.TRANSPARENT
	radio.station_changed.connect(_station_changed)

func _station_changed():
	text = 'Channel: %s' % radio.channel_names[radio.idx]
	modulate = Color.WHITE

	if tween: 
		tween.kill()

	tween = create_tween()
	tween.tween_interval(3)
	tween.chain().tween_property(self, 'modulate', Color.TRANSPARENT, 2)
