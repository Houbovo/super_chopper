extends KinematicBody2D


func _ready() -> void:
	position = Global.start_position
	$AnimatedSprite.play()
	show()
	# print(get_node("../Camera2D").position)

func _process(delta: float) -> void:
	var velocity = Vector2()
	# var cam_pos_x = get_node("../Camera2D").position.x
	if (Input.is_action_pressed("ui_right")): #and (position.x < cam_pos_x):
		velocity.x += 1
	if (Input.is_action_pressed("ui_left")): #and (position.x > cam_pos_x - 100): 
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * Global.speed
	position.y += velocity.y * delta
	position.x += (velocity.x + 10) * delta
	
func die() -> void:
	queue_free()