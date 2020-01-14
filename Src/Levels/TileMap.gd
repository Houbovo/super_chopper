extends TileMap

func _on_Area2D_body_entered(body) -> void:
	if body != self:
		if body.get_collision_layer_bit(0) == true:
			body.die()

