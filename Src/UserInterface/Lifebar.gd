extends HBoxContainer

var life = preload("res://Assets/Misc/life.png")


func show_lives(value: int) -> void:
	for i in get_child_count():
		get_child(i).visible = i < value
