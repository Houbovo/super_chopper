extends Node


signal updated
signal died
signal reset

var score: = 0 setget set_score
var lives: = 5 setget set_lives
const speed = 100
const start_position = Vector2(100, 100)
var fw_speed = 20
const chopper_size = Vector2(32, 16)


func reset():
	self.score = 0
	self.lives = 5
	emit_signal("reset")


func set_score(new_score: int) -> void:
	score = new_score
	emit_signal("updated")


func set_lives(new_value: int) -> void:
	lives = new_value
	emit_signal("died")
