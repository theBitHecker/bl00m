extends Camera2D

func _process(delta):
	var input_vector = Input.get_vector("left", "right", "up", "down")
	position += input_vector*delta*4000
	
	
