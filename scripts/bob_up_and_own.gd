extends StaticBody2D

@export var FOLLOW_SPEED : int
var goal : Vector2
func _init():
	goal = Vector2(0,-4)
func _physics_process(delta):
	position = position.lerp(goal,delta * FOLLOW_SPEED)
	check_goal()
func check_goal():
	#if position == goal:
	if position.y < -3.6:
		goal = Vector2(0,0)
		return
	if position.y > -.6:
		goal = Vector2(0,-4)
		return
