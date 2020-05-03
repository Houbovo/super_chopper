extends KinematicBody2D

func _ready() -> void:
	$Sprite.frame = 0

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func _on_Area2D_body_entered(body) -> void:
	if body != self:
		if body.get_collision_layer_bit(0) == true:
			body.die()
		else:
			queue_free()

# when hit, add fuel to chopper
func die() -> void:
	Global.fuel += 100
	Global.score += 50
	$Sprite/AnimationPlayer.play("Dying")
	yield($Sprite/AnimationPlayer, "animation_finished")
	queue_free()
