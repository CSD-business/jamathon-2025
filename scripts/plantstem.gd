extends Node2D
var leaf = load("res://scenes/leaf.tscn")
var branch = load("res://scenes/plantbranch.tscn")
func _on_stem_grower_spawnleaf():
	var flip = randi_range(0,1)
	var new_leaf = leaf.instantiate()
	if flip == 1:
		new_leaf.scale.x = -1
	new_leaf.position = $Path2D/StemGrower.position
	add_child(new_leaf)
	print("new leaf")

func _on_stem_grower_spawnbranch(pos):
	var flip = randi_range(0,1)
	var new_branch = branch.instantiate()
	new_branch.position = pos
	if flip == 1:
		new_branch.scale.x = -1
	add_child(new_branch)
	print("new branch. WOw!")
