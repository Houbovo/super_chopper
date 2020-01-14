extends KinematicBody2D

var velocity: Vector2 = Vector2(200, 0)
var grav: = 300


func _ready() -> void:
	$AudioStreamPlayer2D.play()


func _physics_process(delta: float) -> void:
	velocity.y += grav * delta
	self.position.x += delta * velocity.x
	self.position.y += velocity.y * delta


func _on_Area2D_body_entered(body) -> void:
	if body != self:
		if body.get_collision_layer_bit(1) == true:
			body.die()
		die()


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func die() -> void:
	queue_free()




