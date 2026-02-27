extends Camera2D

func _process(delta):
	var input_vector = Input.get_vector("left", "right", "up", "down")
	position += input_vector*delta*1000
	var camera_input = (2**(Input.get_axis("zoom out", "zoom in"))*2
	if camera_input != 1:
		zoom = zoom.lerp(Vector2(camera_input, camera_input), delta).clamp(Vector2(.25, .25), Vector2(1, 1))
	
	
