extends Control


var res_arr = [Vector2(480, 270), Vector2(960, 540), Vector2(1440, 810), Vector2(1920, 1080)]
var next_scene_path: = Status.next_level


func _input(event):
	if event.is_action_released("change_window_res"):
		change_window_size()
	if event.is_action_released("toggle_music"):
		AudioServer.set_bus_mute(1, not AudioServer.is_bus_mute(1))
	if event.is_action_released("toggle_sfx"):
		AudioServer.set_bus_mute(2, not AudioServer.is_bus_mute(2))
	if event.is_action_released("quit"):
		get_tree().quit()
	if event.is_action_released("ui_shoot"):
		if Status.from_main_menu == true:
			get_tree().change_scene("res://Src/Levels/Level01-pre.tscn")
			Status.from_main_menu = false
		else:
			get_tree().change_scene(next_scene_path)

func change_window_size() -> void:
	Status.change_window_size()
