extends Node2D

func _ready() -> void:
	$LevelTimer.start(55)
	

func _on_LevelTimer_timeout() -> void:
	get_tree().reload_current_scene()
