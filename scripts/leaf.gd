extends Node2D
var is_selected : bool
var LeafRB = load("res://scenes/leaf_rb.tscn")
@export var HP : int
signal spawnleaf

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and is_selected:
			take_damage(1)
			check_death()
func take_damage(damage):
	HP = HP - damage
	modulate = (Color(1,0,0,1))
	$Hurt.play()
	await get_tree().create_timer(.1).timeout
	modulate = (Color(1,1,1,1))
func check_death():
	if HP <= 0:
		$Hurt.play()
		spawnleaf.emit()
		get_parent().leaves -=1
		get_parent().can_wither = true
		print(get_parent().leaves)
		queue_free()
		var new_leafrb = LeafRB.instantiate()
		if scale.x == -1:
			new_leafrb.scale.x = -1
		new_leafrb.linear_velocity = Vector2(randf_range(-60,60),randf_range(-100,-50))
		new_leafrb.position = self.global_position
		get_parent().add_sibling(new_leafrb)
		

func _on_leaf_area_2d_mouse_entered():
	is_selected = true
func _on_leaf_area_2d_mouse_exited():
	is_selected = false
