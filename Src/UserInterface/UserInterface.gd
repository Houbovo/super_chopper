extends Control

var lives: int = Global.lives
var w_sizes

func _ready() -> void:
	Global.connect("updated", self, "update_score")
	update_score()
	$Lifebar.show_lives(lives)


func update_score() -> void:
	$Score.text = "Score: %s" % Global.score
