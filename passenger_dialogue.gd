extends NinePatchRect

@onready var label = $RichTextLabel2

func _ready() -> void:
	modulate = Color.TRANSPARENT

func set_content(message):
	label.text = 'Passenger:\n%s' % message
	var tween = create_tween()
	tween.tween_property(self, 'modulate', Color.WHITE, 1)

func fade_out():
	var tween = create_tween()
	tween.tween_property(self, 'modulate', Color.TRANSPARENT, 1)
