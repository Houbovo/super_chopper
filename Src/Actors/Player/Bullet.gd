extends KinematicBody2D

var speed: = 200

func _ready() -> void:
	$AudioStreamPlayer2D.play()


func _physics_process(delta: float) -> void:
	self.position.x += delta * speed


func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	if body != self:
		if body.get_collision_layer_bit(1) == true:
			body.die()
		queue_free()


func _on_VisibilityNotifier2D_screen_exited() -> void:
	die()

func die() -> void:
	queue_free()
