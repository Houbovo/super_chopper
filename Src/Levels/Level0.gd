extends Node2D

var next_scene_path: = preload("res://Src/Levels/Level02.tscn")

func _ready() -> void:
	Global.next_level = next_scene_path
	$LevelTimer.start(55)
	Global.fuel = Global.max_fuel


func _on_LevelTimer_timeout() -> void:
	get_tree().change_scene_to(next_scene_path)
