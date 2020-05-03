extends Control

var res_arr = [Vector2(480, 270), Vector2(960, 540), Vector2(1440, 810), Vector2(1920, 1080)]
var next_scene_path: = "res://Src/Levels/Level01.tscn"

func _ready() -> void:
	$Sprite/AnimationPlayer.play("Flying")


func _input(event):
	if event.is_action_released("change_window_res"):   # Input.is_action_just_pressed("change_window_res"):
		change_window_size()
	if event.is_action_released("toggle_music"):
		AudioServer.set_bus_mute(1, not AudioServer.is_bus_mute(1))
	if event.is_action_released("toggle_sfx"):
		AudioServer.set_bus_mute(2, not AudioServer.is_bus_mute(2))
	if event.is_action_released("ui_shoot"):
		get_tree().change_scene(next_scene_path)
	if event.is_action_released("quit"):
		get_tree().quit()

func change_window_size() -> void:
	if Global.act_res < 3:
		Global.act_res += 1
	else:
		Global.act_res = 0
	OS.set_window_size(res_arr[Global.act_res])
