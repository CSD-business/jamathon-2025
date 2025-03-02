extends RigidBody2D
@export var growing_texture : Texture
var tree = load("res://scenes/plantstem.tscn")
var planted = false
var can_grow = false
func _init():
	linear_velocity.x = randf_range(-10,10)
func _physics_process(delta):
	if linear_velocity.y == 0 and planted == false and can_grow:
		plant()

func plant():
	planted = true
	$Sprout.show()
	$Acorn.hide()
	$Timer.start()
	
	
	
func _on_timer_timeout():
	print("growing")
	var new_tree = tree.instantiate()
	new_tree.position = self.global_position
	get_parent().add_child(new_tree)
	queue_free()


func _on_spawn_timer_timeout():
	can_grow = true
