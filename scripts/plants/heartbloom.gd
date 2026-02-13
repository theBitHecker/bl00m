extends Node2D


@export var plant_data: PlantData
var growth: float
var life_stage: String
var regen_timer = 0
func _ready():
	growth = plant_data.min_growth_sec
	life_stage = "growing"


func tick(delta: int):
	if regen_timer <= 0:
		regen_timer = 0
		grow(delta)
	else:
		regen_timer -= delta
	

func grow(delta: int):
	growth = delta
	growth = clampf(growth, plant_data.min_growth_sec, plant_data.max_growth_sec)
	if growth >= plant_data.min_growth_sec and growth <= plant_data.growth_stages_sec[0]:
		get_node("Sprite").play("grow-1")
	elif growth > 0 and growth <= plant_data.low_health and life_stage == "matured":
		get_node("Sprite").play("low")
	elif growth == plant_data.max_growth_sec:
		get_node("Sprite").play("full")
		life_stage = "matured"
	else:
		get_node("Sprite").play("base")
		life_stage = "maturing"
		
func damage(amount: float):
	if amount > 0 and life_stage == "growing":
		die()
	life_stage = "matured"
	regen_timer += plant_data.regen_block_sec
	growth -= amount * plant_data.growth_loss_sec_per_damage

func die():
	print("uh oh")
	
	
