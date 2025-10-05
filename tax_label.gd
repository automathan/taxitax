extends RichTextLabel

var template = 'Time until tax ($%d): %dm %ds'

func _physics_process(_delta: float) -> void:
	var tax_time = Economy.tax_time
	text = template % [Economy.tax_amount, floor(tax_time / 60), int(tax_time) % 60]
