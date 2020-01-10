extends Control

var res_arr = [Vector2(480, 270), Vector2(960, 540), Vector2(1920, 1080)]
var next_scene_path: = "res://Src/Levels/Level01.tscn"

func _ready() -> void:
	print("main menu")


func _input(event):
	if event.is_action_released("change_window_res"):   # Input.is_action_just_pressed("change_window_res"):
		change_window_size()
	if event.is_action_released("ui_shoot"):
		print("change scene")
		get_tree().change_scene(next_scene_path)


func change_window_size() -> void:
	if Global.act_res < 2:
		Global.act_res += 1
	else:
		Global.act_res = 0
	OS.set_window_size(res_arr[Global.act_res])