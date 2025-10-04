extends Node

signal cash_changed

var cash: float = 100

func add_cash(value):
	cash += value
	cash_changed.emit()
