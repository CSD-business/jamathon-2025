extends Path2D


func _init():
	var stemlength = randi_range(10,15) #how many points
	var stemheight = randi_range(7,9)
	for i in range(stemlength):
		curve.add_point(Vector2(randi_range(-2,2),-i*4))
