extends KinematicBody2D

var Bullet = preload("res://Src/Actors/Enemies/PanzerBullet.tscn")


func _ready() -> void:
	$Sprite.frame = 0
	randomize()


func _on_Area2D_body_entered(body) -> void:
	if body != self:
		if body.get_collision_layer_bit(0) == true or body.get_collision_layer_bit(1) == true:
			body.die()
		queue_free()

# shoot with some probability after some time when enters screen
func _on_VisibilityEnabler2D_screen_entered() -> void:
	shoot_prepare()


func shoot_prepare() -> void:
	var shoot_time: = rand_range(1, 15 )
	if shoot_time < 10:
		$ShootTimer.start( shoot_time )


# not needed anymore, free it
func _on_VisibilityEnabler2D_screen_exited() -> void:
	queue_free()


# shoot if should
func _on_ShootTimer_timeout() -> void:
	$Sprite/AnimationPlayer.play("Shooting")
	var Pbullet = Bullet.instance()
	Pbullet.position = ($BulletPosition as Position2D).global_position
	get_parent().add_child(Pbullet)
	shoot_prepare()


func die() -> void:
	Global.score += 100
	$ShootTimer.stop()
	$Sprite/AnimationPlayer.play("Dying")
	yield($Sprite/AnimationPlayer, "animation_finished")
	queue_free()
