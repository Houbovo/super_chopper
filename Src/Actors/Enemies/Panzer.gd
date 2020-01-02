extends KinematicBody2D

var Bullet = preload("res://Src/Actors/Enemies/PanzerBullet.tscn")


func _ready() -> void:
	randomize()

func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	if body != self:
		if body.get_collision_layer_bit(0) == true:
			body.die()
		queue_free()


func _on_VisibilityEnabler2D_screen_entered() -> void:
	var shoot_time: = int(rand_range(1, 40))
	print(self.name)
	print( shoot_time )
	if shoot_time < 20:
		$ShootTimer.start( shoot_time )


func _on_ShootTimer_timeout() -> void:
	var Pbullet = Bullet.instance()
	Pbullet.position = ($BulletPosition as Position2D).global_position
	get_parent().add_child(Pbullet)


func die() -> void:
	queue_free()







