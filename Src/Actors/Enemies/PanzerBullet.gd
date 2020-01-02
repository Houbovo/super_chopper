extends KinematicBody2D

const speed = 200

func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	if body != self:
		if body.collision_layer == 1:
			body.die()
		queue_free()


func _process(delta: float) -> void:
	self.position.x -= delta * speed
	self.position.y -= delta * speed


func die() -> void:
	queue_free()
