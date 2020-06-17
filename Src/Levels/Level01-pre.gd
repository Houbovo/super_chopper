extends Node2D

func _ready() -> void:
	get_tree().get_root().set_disable_input(true)
	$Timer.start(2)
	$AudioStreamPlayer.play()

func _on_Timer_timeout() -> void:
	get_tree().get_root().set_disable_input(false)
