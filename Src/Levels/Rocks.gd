extends KinematicBody2D


func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	if body.collision_layer == 1:
		body.die()
