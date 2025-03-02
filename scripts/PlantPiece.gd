extends Node2D
var withering = false
var t = 0
var destx 
var desty
func _init():
	add_to_group("witherable")
func wither():
	withering = true
	destx = randi_range(position.x-1,position.x+1)
	desty = randi_range(position.y-1,position.y+1)
func _physics_process(delta):
	if withering == true:
		position = lerp(position,Vector2(destx,desty),t)
		if scale.x > 0:
			scale.x -= t
		if scale.y > 0:
			scale.y -= t
		if t < 1:
			t += .6 * delta
		else:
			queue_free()

