extends RigidBody2D
signal clicked
var can_be_held = false
var held = false
var selected = false
var leaf = load("res://leaf_rb.tscn")
var anchor = load("res://scenes/anchor.tscn")
var decaypiece = load("res://scenes/decaypiece.tscn")
var t = 0
var fadevalue = 1
var showing = true
func _init():
	add_to_group("leaf")
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and held:
			drop()
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and can_be_held and selected and GlobalVar.is_something_held == false:
			pickup()

func _physics_process(delta):
	if held:
		global_transform.origin = get_global_mouse_position()
	if GlobalVar.is_something_held and GlobalVar.tutorial == true:
		flicker()
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

func flicker():
	$TutorialArrow.show()
	$TutorialArrow.modulate = Color(1,1,1,t)
	
	if showing:
		t+=.005
	if !showing:
		t-=.005
	if t > .96:
		showing = false
	if !showing and t<.04:
		$TutorialArrow.hide()
	
	


func _on_decay_timer_timeout():
	for i in range(randi_range(20,25)):
		var new_plant = decaypiece.instantiate()
		add_child(new_plant)
		$decaysound.play()
		$decaysound.volume_db-=.5
		modulate = Color(1,1,1,fadevalue)
		fadevalue -= .05
		await get_tree().create_timer(.1).timeout 
		GlobalVar.money += .01
	queue_free()
