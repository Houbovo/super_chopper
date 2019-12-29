extends KinematicBody2D

var speed: = 200

func _process(delta: float) -> void:
	self.position.x += delta * speed


func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	if body.get_collision_layer_bit(1) == true:
		body.die()
	queue_free()
	
func _on_VisibilityNotifier2D_screen_exited() -> void:
	Global.bullets_no -= 1
	queue_free()

