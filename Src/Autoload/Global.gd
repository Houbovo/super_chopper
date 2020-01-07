extends Node


signal updated
signal died
signal reset
signal fuel_up

var score: int = 0 setget set_score
var lives: int = 5 setget set_lives
var fuel: float = 400 setget set_fuel
const speed = 100
const start_position = Vector2(100, 100)
var fw_speed = 20
const chopper_size = Vector2(32, 16)
var act_res: int = 0


func reset():
	self.score = 0
	self.lives = 5
	emit_signal("reset")


func set_score(new_score: int) -> void:
	score = new_score
	emit_signal("updated")


func set_lives(new_value: int) -> void:
	lives = new_value
	self.fuel = 400
	self.fw_speed = 20
	emit_signal("died")


func set_fuel(new_fuel: float) -> void:
	if new_fuel < 400:
		fuel = new_fuel
	else:
		fuel = 400
	emit_signal("fuel_up")
