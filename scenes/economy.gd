extends Node

signal cash_changed
signal game_over

var cash: float = 100
var tax_time: float
var tax_amount: float

func _ready() -> void:
	tax_time = 150
	tax_amount = 300

func _physics_process(delta: float) -> void:
	tax_time -= delta
	if tax_time <= 0:
		pay_tax()

func pay_tax():
	add_cash(-tax_amount)
	tax_amount += 50
	tax_time = 150

func add_cash(value):
	cash += value
	cash_changed.emit()

	if cash < 0:
		game_over.emit()
