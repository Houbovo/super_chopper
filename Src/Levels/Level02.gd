extends Node2D

var next_scene_path: = preload("res://Src/Levels/Level03-pre.tscn")
var next_level:= "res://Src/Levels/Level03.tscn"

func _ready() -> void:
	Global.next_level = next_scene_path
	$LevelTimer.start(55)
	Global.fuel = Global.max_fuel
	$AudioStreamPlayer.play()


func _on_LevelTimer_timeout() -> void:
	Status.next_level = next_level
	get_tree().change_scene_to(next_scene_path)
