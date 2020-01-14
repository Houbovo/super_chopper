extends KinematicBody2D

var Bullet = preload("res://Src/Actors/Player/Bullet.tscn")
var MiniRocket = preload("res://Src/Actors/Player/MiniRocket.tscn")
var fuel_comsum: int = 10


func _ready() -> void:
	position = Global.start_position
	$AnimatedSprite.play()
	($SoundFly as AudioStreamPlayer2D).play()
	show()


func _physics_process(delta: float) -> void:
	var velocity = Vector2()
		# moving in left half of the screen, still moving forward
	if Global.fuel > 0:
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
	else:
		position.x += Global.fw_speed * delta
		position.y += Global.fw_speed * delta
	
	# now are bullets and minirockets shot by one key
	if Input.is_action_pressed("ui_shoot"):
		bullet_shoot()
		minirocket_shoot()
	
	# Fuel consumption
	if Global.fuel >= 0:
		Global.fuel -= fuel_comsum * delta


# only 4 bullets on screen, shot after some time
func bullet_shoot() -> void:
	if $BulletTimer.is_stopped() == true:
		if count_nodes("Bullet") < 4:
			var bullet = Bullet.instance()
			bullet.position = ($BulletPosition as Position2D).global_position
			get_parent().add_child(bullet)
			$BulletTimer.start(0.1)


# only 2 minirockets on screen, shot after some time
func minirocket_shoot() -> void:
	if $MiniRocketTimer.is_stopped() == true:
		if count_nodes("MiniRocket") < 2:
			var minirocket = MiniRocket.instance()
			minirocket.position = ($MiniRocketPosition as Position2D).global_position
			get_parent().add_child(minirocket)
			$MiniRocketTimer.start(0.3)


# get number of bullets/minirockets from level node
func count_nodes(nodename: String) -> int:
	var number: int = 0
	for node in get_parent().get_children():
		if nodename in node.name:
			number += 1
	return number


# When chopper hits rocks, it has to die
func _on_Area2D_body_entered(body) -> void:
	if body.get_collision_layer_bit(3) == true:
		self.die()


# when die, stop camera, play animation TBD, etc.
func die() -> void:
	call_deferred("set", $CollisionShape2D.disabled, true ) 
#	Global.fw_speed = 0
	Global.lives -= 1
	queue_free()
	get_tree().reload_current_scene()

