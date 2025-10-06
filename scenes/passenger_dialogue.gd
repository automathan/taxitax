extends NinePatchRect

@onready var label = $RichTextLabel2
@onready var reward_label = $RewardLabel

func _ready() -> void:
	modulate = Color.TRANSPARENT

func set_content(waypoint):
	label.text = 'Passenger:\nTake me to %s' % waypoint.display_name
	reward_label.text = '$%d' % waypoint.reward
	var tween = create_tween()
	tween.tween_property(self, 'modulate', Color.WHITE, 1)

func fade_out():
	var tween = create_tween()
	tween.tween_property(self, 'modulate', Color.TRANSPARENT, 1)
