extends NinePatchRect

@onready var label = $RichTextLabel

func _ready() -> void:
	Economy.cash_changed.connect(refresh)
	refresh()

func refresh():
	label.text = '$%d' % Economy.cash
