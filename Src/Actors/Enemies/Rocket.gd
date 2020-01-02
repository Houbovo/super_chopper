extends KinematicBody2D

var fly: bool = false
var speed: int = 100

func _ready() -> void:
	randomize()

func _process(delta: float) -> void:
	if fly == true:
		self.position.y -= delta * speed

func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	if body != self:
		if body.get_collision_layer_bit(0) == true:
			body.die()
		queue_free()


func _on_VisibilityEnabler2D_screen_entered() -> void:
	var fly_time: = int(rand_range(1, 40))
	print(self.name)
	print( fly_time )
	if fly_time < 20:
		$FlyTimer.start( fly_time )


func _on_FlyTimer_timeout() -> void:
	fly = true


func die() -> void:
	queue_free()
