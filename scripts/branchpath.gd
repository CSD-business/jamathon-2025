extends Path2D


func _init():
	var this_curve = Curve2D.new()
	var stemlength = randi_range(2,3) #how many points
	var stemheight = randi_range(7,9)
	curve = this_curve
	for i in range(stemlength):
		curve.add_point(Vector2(randi_range(-2,2),position.y-i))
