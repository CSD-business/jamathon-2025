extends PathFollow2D
@onready var acorn = load("res://scenes/acorn.tscn")
func _init():
	pass
func _process(delta):
	progress_ratio+= .05
	if randi_range(1,1000) < GlobalVar.acorn_chance and GlobalVar.trees < GlobalVar.max_trees and GlobalVar.tutorial == false:
		spawn_acorn()
func spawn_acorn():
	var new_acorn = acorn.instantiate()
	new_acorn.position = self.global_position
	get_parent().add_child(new_acorn)
		

func _on_timer_timeout():
	spawn_acorn()
