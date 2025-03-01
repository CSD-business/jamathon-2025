extends Node2D
var is_selected : bool
@export var HP : int
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and is_selected:
			take_damage(1)
			check_death()
func _on_leaf_rb_mouse_entered():
	is_selected = true
func _on_leaf_rb_mouse_exited():
	is_selected = false
func take_damage(damage):
	HP = HP - damage
	modulate = (Color(1,0,0,1))
	$Hurt.play()
	await get_tree().create_timer(.1).timeout
	modulate = (Color(1,1,1,1))
func check_death():
	if HP <= 0:
		for child in self.find_children("*"):
			if child.is_in_group("QueueOnDeath"):
				child.queue_free()
		
