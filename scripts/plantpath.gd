extends Path2D


func _init():
	var this_curve = Curve2D.new()
	var stemlength = randi_range(8,15) #how many points
	var stemheight = randi_range(10,20)
	curve = this_curve
	for i in range(stemlength):
		curve.add_point(Vector2(randi_range(-10,10),-i*stemheight))
