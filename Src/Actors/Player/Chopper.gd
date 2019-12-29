extends KinematicBody2D

var Bullet = preload("res://Src/Actors/Player/Bullet.tscn")

func _ready() -> void:
	position = Global.start_position
	$AnimatedSprite.play()
	show()

func _process(delta: float) -> void:
	var velocity = Vector2()
	var last_shot: float = 99
	# var cam_pos_x = get_node("../Camera2D").position.x
	if (Input.is_action_pressed("ui_right")) and (self.position.x < get_node("../Camera2D").position.x + 200 ):
		velocity.x += 1
	if (Input.is_action_pressed("ui_left")) and (self.position.x > get_node("../Camera2D").position.x + Global.chopper_size.x / 2):
		velocity.x -= 1
	if (Input.is_action_pressed("ui_up")) and (self.position.y > get_node("../Camera2D").position.y + Global.chopper_size.y / 2):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * Global.speed
	position.y += velocity.y * delta
	position.x += (velocity.x + Global.fw_speed) * delta
	
	if Input.is_action_pressed("ui_shoot") and Global.bullets_no < 4 and $BulletTimer.is_stopped() == true:
		shoot()



func shoot() -> void:
	var bullet = Bullet.instance()
	bullet.position = ($BulletPosition as Position2D).global_position
	get_parent().add_child(bullet)
	Global.bullets_no += 1
	$BulletTimer.start( 0.1 )
	

func die() -> void:
	call_deferred("set", $CollisionShape2D.disabled, true ) 
	Global.fw_speed = 0
	queue_free()