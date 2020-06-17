extends KinematicBody2D

var speed: int = 0


func _ready() -> void:
	$Sprite.frame = 0


func _physics_process(delta: float) -> void:
	self.position.x -= speed * delta


func _on_VisibilityEnabler2D_screen_entered() -> void:
	speed = 200
	$Sprite/AnimationPlayer.play("Flying")


func _on_VisibilityEnabler2D_screen_exited() -> void:
	queue_free()


func _on_Area2D_body_entered(body) -> void:
	if body != self:
		if body.get_collision_layer_bit(0) == true or body.get_collision_layer_bit(1) == true:
			body.die()
		queue_free()


func die() -> void:
	Global.score += 50
	$Sprite/AnimationPlayer.play("Dying")
	yield($Sprite/AnimationPlayer, "animation_finished")
	queue_free()
