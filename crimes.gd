extends Control

@onready var label = $RichTextLabel

var crime_list: Array[String]

func _ready() -> void:
	Economy.new_crime.connect(add_crime)
	refresh()

func add_crime(crime: String):
	crime_list.append(crime)
	refresh()

func refresh():
	label.clear()
	label.push_color(Color.WHITE)
	label.add_text('Criminal Record:')

	for i in range(len(crime_list)):
		label.push_color(Color(1, 1, 1, 1 - float(i) / 10))
		label.add_text('\n%s' % crime_list[len(crime_list) - 1 - i])
