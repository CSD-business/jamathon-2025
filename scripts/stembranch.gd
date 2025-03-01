extends Node2D
var leaf = load("res://scenes/leaf.tscn")

func _on_stem_grower_spawnleaf():
	var flip = randi_range(0,1)
	var new_leaf = leaf.instantiate()
	if flip == 1:
		new_leaf.scale.x = -1
	new_leaf.position = $Path2D/StemGrower.position
	add_child(new_leaf)
	print("new leaf")
