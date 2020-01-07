extends HBoxContainer

var bar_red = preload("res://Assets/Misc/barHorizontal_red.png")
var bar_yellow = preload("res://Assets/Misc/barHorizontal_yellow.png")
var bar_green = preload("res://Assets/Misc/barHorizontal_green.png")


func _ready() -> void:
	Global.connect("fuel_up", self, "update_fuel")
	$FuelBar.texture_progress = bar_green
	update_fuel()

# Update progress bar and change color
func update_fuel() -> void:
	var fuel: float = Global.fuel
	$FuelBar.value = fuel
	if fuel > 200:
		$FuelBar.texture_progress = bar_green
	if fuel <= 200:
		$FuelBar.texture_progress = bar_yellow
	if fuel <= 100:
		$FuelBar.texture_progress = bar_red
	