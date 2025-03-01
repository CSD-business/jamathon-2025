extends Node2D
var leaf = load("res://scenes/leaf.tscn")
var piece = load("res://scenes/plant_piece.tscn")

func _on_stem_grower_spawnleaf():
	var flip = randi_range(0,1)
	var new_leaf = leaf.instantiate()
	if flip == 1:
		new_leaf.scale.x = -1
	new_leaf.position = $Path2D/StemGrower.position
	add_sibling(new_leaf)
	get_parent().leaves+=1

func _on_stem_grower_spawnpiece():
	var new_stem = piece.instantiate()
	var heightratio = 1-$Path2D/StemGrower.progress_ratio
	new_stem.position = $Path2D/StemGrower.position
	new_stem.scale = Vector2(heightratio/2,heightratio/2)
	add_sibling(new_stem)
