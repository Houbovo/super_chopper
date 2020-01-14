extends KinematicBody2D


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	if body != self:
		if body.get_collision_layer_bit(3) == true:
			die()
		else:
			queue_free()

# when hit, add fuel to chopper
func die() -> void:
	Global.fuel += 100
	Global.score += 50
	queue_free()