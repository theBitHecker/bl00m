extends PlantData
class_name HeartbloomData

@export_group("Starting Resources")
@export var starting_water: int
@export var starting_sunlight: int
@export var starting_metal: int

@export_group("Heartbloom Only")
@export var build_radius: int
@export var dehydration_immune: bool
@export var water_flow_generation: float
