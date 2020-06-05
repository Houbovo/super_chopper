extends Control

var next_level: = "res://Src/Levels/Level01.tscn"

func _ready() -> void:
	$Sprite/AnimationPlayer.play("Flying")
	Status.next_level = next_level



