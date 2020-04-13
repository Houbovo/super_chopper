extends KinematicBody2D

var fly: bool = false
var speed: int = 100


func _ready() -> void:
	randomize()
	$Sprite.frame = 0
	

func _physics_process(delta: float) -> void:
	# when "unpaused" fly up
	if fly == true:
		self.position.y -= delta * speed


func _on_Area2D_body_entered(body) -> void:
	if body != self:
		if body.get_collision_layer_bit(0) == true:
			body.die()
		queue_free()

# fly with some probability after some time when enters screen
func _on_VisibilityEnabler2D_screen_entered() -> void:
	var fly_time: = rand_range(1, 10)
	if fly_time < 8:
		$FlyTimer.start( fly_time )


# timer to fly
func _on_FlyTimer_timeout() -> void:
	fly = true
	$Sprite/AnimationPlayer.play("Flying")


func die() -> void:
	Global.score += 100
	$FlyTimer.stop()
	$Sprite/AnimationPlayer.play("Dying")
	yield($Sprite/AnimationPlayer, "animation_finished")
	queue_free()
