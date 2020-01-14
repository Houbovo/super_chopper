extends KinematicBody2D

var Bullet = preload("res://Src/Actors/Enemies/PanzerBullet.tscn")


func _ready() -> void:
	randomize()


func _on_Area2D_body_entered(body) -> void:
	if body != self:
		if body.get_collision_layer_bit(0) == true or body.get_collision_layer_bit(1) == true:
			body.die()
		queue_free()

# shoot with some probability after some time when enters screen
func _on_VisibilityEnabler2D_screen_entered() -> void:
	#var shoot_time: = int(rand_range(1, 40))
	var shoot_time: = 10
	if shoot_time < 20:
		$ShootTimer.start( shoot_time )


# not needed anymore, free it
func _on_VisibilityEnabler2D_screen_exited() -> void:
	queue_free()


# shoot if should
func _on_ShootTimer_timeout() -> void:
	var Pbullet = Bullet.instance()
	Pbullet.position = ($BulletPosition as Position2D).global_position
	print(Pbullet.position)
	get_parent().add_child(Pbullet)


func die() -> void:
	Global.score += 100
	queue_free()
