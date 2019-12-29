extends Camera2D

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	self.position.x += delta * Global.fw_speed