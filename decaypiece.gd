extends Node2D
var t = 0
var goal = Vector2(randi_range(-50,50),-400)
func _physics_process(delta):
	if scale.x > 0:
		scale.x = 1-t*4
	if scale.y > 0:
		scale.y = 1-t*4
	position = lerp(position,goal,t)
	t+=.02
