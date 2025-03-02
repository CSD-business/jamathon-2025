extends Sprite2D

var rotate_range = deg_to_rad(20)
var rotate_speed = .05
var rotate_start

func _ready():
	rotate_start = rotation

func _process(delta):
	rotation += rotate_speed * delta
	var rotate_diff = rotation - rotate_start 
	if abs(rotate_diff) > rotate_range:
		rotation = rotate_start + rotate_range * sign(rotate_diff)
		rotate_speed *= -1
