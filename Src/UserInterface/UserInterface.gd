extends Control


func _ready() -> void:
	Global.connect("updated", self, "update_interface")
	update_interface()


func update_interface() -> void:
	$Score.text = "Score: %s" % Global.score