extends KinematicBody2D

var Bullet = preload("res://Src/Actors/Enemies/PanzerBullet.tscn")


func _ready() -> void:
	$ShootTimer.start( 5 )

func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	if body.collision_layer == 1:
		body.die()


func _on_Timer_timeout() -> void:
	var Pbullet = Bullet.instance()
	Pbullet.position = ($BulletPosition as Position2D).global_position
	get_parent().add_child(Pbullet)

func die() -> void:
	queue_free()


