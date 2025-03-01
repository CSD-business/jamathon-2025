extends Path2D


func _init():
	var stemlength = randi_range(3,15) #how many points
	var stemheight = randi_range(3,10)
	for i in range(stemlength):
		curve.add_point(Vector2(randi_range(-10,10),-i*10))
		print("Added point " + str(i))
