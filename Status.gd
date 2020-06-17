extends Node


var res_arr = [Vector2(480, 270), Vector2(960, 540), Vector2(1440, 810), Vector2(1920, 1080)]
var act_res: int = 0
var next_level: = "res://Src/Levels/Level01-pre.tscn"
var from_main_menu: bool = true

func change_window_size() -> void:
	act_res += 1
	if act_res == res_arr.size():
		act_res = 0
	OS.set_window_size(res_arr[act_res])


func status_music():
	pass

func status_sfx():
	pass

func status_autofire():
	pass

