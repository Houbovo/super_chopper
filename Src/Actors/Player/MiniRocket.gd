extends KinematicBody2D

var velocity: Vector2 = Vector2(200, 0)
var grav: = 200


func _ready() -> void:
	$AudioStreamPlayer2D.play()
	$Sprite.frame = 0


func _physics_process(delta: float) -> void:
	velocity.y += grav * delta
	self.position.x += delta * velocity.x
	self.position.y += velocity.y * delta
	if (0.3 * velocity.x < velocity.y):
		if (0.8 * velocity.x < velocity.y):
			$Sprite.frame = 2
		else:
			$Sprite.frame = 1


func _on_Area2D_body_entered(body) -> void:
	if body != self and body.get_collision_layer_bit(0) == false:
		if body.get_collision_layer_bit(1) == true:
			body.die()
		die(body)


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func die(what) -> void:
	velocity = Vector2(0,0)
	grav = 0
	if what.get_collision_layer_bit(3) == true:
		$Sprite/AnimationPlayer.play("Boom-empty")
	else:
		$Sprite/AnimationPlayer.play("Boom-enemy")
	yield($Sprite/AnimationPlayer, "animation_finished")
	queue_free()




