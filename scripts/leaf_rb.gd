extends RigidBody2D
signal clicked
var can_be_held = false
var held = false
var selected = false
var leaf = load("res://leaf_rb.tscn")
var anchor = load("res://scenes/anchor.tscn")

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and held:
			drop()
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and can_be_held and selected and GlobalVar.is_something_held == false:
			pickup()

func _physics_process(delta):
	if held:
		global_transform.origin = get_global_mouse_position()
	
func pickup():
	held = true
	var new_anchor = anchor.instantiate()
	add_child(new_anchor)
	GlobalVar.is_something_held = true

func drop():
	$Anchor.queue_free()
	held = false
	can_be_held = false
	$Timer.start()
	GlobalVar.is_something_held = false
	
func _on_timer_timeout():
	can_be_held = true


func _on_area_2d_mouse_entered():
	selected = true

func _on_area_2d_mouse_exited():
	selected = false
