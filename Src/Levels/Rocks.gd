extends Area2D

func _ready() -> void:
	pass

func _on_rocksbottom_body_entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("Players"):
		body.die()
