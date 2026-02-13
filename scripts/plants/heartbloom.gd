extends Node2D


@export var plant_data: PlantData
var growth: float
var life_stage: String
func _ready():
	growth = plant_data.min_growth_sec
	life_stage = "growing"


func tick(delta: int):
	
	growth += delta
	growth = clampf(growth, plant_data.min_growth_sec, plant_data.max_growth_sec)
	if growth >= plant_data.min_growth_sec and growth <= plant_data.growth_stages_sec[0]:
		get_node("Sprite").play("grow-1")
	elif growth > plant_data.growth_stages_sec[0] and growth <= plant_data.growth_stages_sec[1]:
		get_node("Sprite").play("grow-2")
	elif growth > plant_data.growth_stages_sec[1] and growth <= plant_data.max_growth_sec:
		get_node("Sprite").play("grow-3")
	elif growth > 0 and growth <= plant_data.low_health and life_stage == "matured":
		get_node("Sprite").play("low")
	elif growth == plant_data.max_growth_sec:
		get_node("Sprite").play("full")
		life_stage = "matured"
	else:
		get_node("Sprite").play("base")
		life_stage = "maturing"
