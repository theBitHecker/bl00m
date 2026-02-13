extends Resource
class_name PlantData

@export_group("Growth")
@export var min_growth_sec: float = -100.0
@export var max_growth_sec: float = 100.0
@export var growth_stages_sec: Array = [-66.7, -33.3]
@export var low_health_sec: float = 20
@export var growth_loss_sec_per_damage = 1
@export var water_flow_usage: float = 10.0

@export_group("Cost")
@export var water_cost: int = 10
@export var sunlight_cost: int = 0
@export var metal_cost: int = 0

#func grow(plant: Node2D, delta: float, growth_multiplier: float):
	#plant.growth += growth_speed_per_sec*delta*growth_multiplier
	#plant.growth = clampf(plant.growth, min_growth, max_growth)
	#for growth_stage_idx in range(len(growth_stages)+1):
		#var growth_stage_bounds = []
		#if growth_stage_idx == 0:
			#growth_stage_bounds = [min_growth, growth_stages[growth_stage_idx]]
		#elif growth_stage_idx == len(growth_stages):
			#growth_stage_bounds = [growth_stages[growth_stage_idx], 0]
		#else:
			#growth_stage_bounds = [growth_stages[growth_stage_idx - 1] ,growth_stages[growth_stage_idx]]
		#if plant.growth >= growth_stage_bounds[0] and plant.growth < growth_stage_bounds[1]:
			#plant.get_node("Sprite").play("grow-%i" % (growth_stage_idx + 1))
	#if plant.growth >= 0 and plant.growth <= low_health and plant.life_stage == "matured":
		#plant.get_node("Sprite").play("low")
	#elif plant.growth == max_growth:
		#plant.get_node("Sprite").play("full")
		#plant.life_stage = "matured"
	#else:
		#plant.get_node("Sprite").play("base")
		#plant.life_stage = "maturing"
		#
#
#func damage(plant: Node2D, amount: float):
	#plant.growth -= amount * growth_loss_per_damage
	#if plant.life_cycle == "growing":
		#die(plant)
	#plant.life_cycle = "matured"
	#if plant.growth >= 0 and plant.growth <= low_health and plant.life_stage == "matured":
		#plant.get_node("Sprite").play("low")
	#elif plant.growth == max_growth:
		#plant.get_node("Sprite").play("full")
	#else:
		#plant.get_node("Sprite").play("base")
#
#func die(plant: Node2D):
	#var map = plant.get_parent()
	#map.set_tile(plant.tile_pos, -1)
	#plant.queue_free()
