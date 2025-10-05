extends Node

signal cash_changed
signal game_over
signal new_crime(String)

var cash: float
var tax_time: float
var tax_amount: float
var is_game_over: bool
var lifetime_earnings: float

func _physics_process(delta: float) -> void:
	tax_time -= delta
	if tax_time <= 0:
		pay_tax()

func pay_tax():
	add_cash(-tax_amount)
	tax_amount += 50
	tax_time = 150

func reset():
	cash = 100
	tax_time = 150
	tax_amount = 250
	lifetime_earnings = 0
	is_game_over = false
	cash_changed.emit()

func add_cash(value, crime_label: String = ''):
	cash += value
	cash_changed.emit()

	if value > 0:
		lifetime_earnings += value

	if len(crime_label) > 0:
		new_crime.emit(crime_label)

	if cash < 0:
		game_over.emit()
		is_game_over = true
