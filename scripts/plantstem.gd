extends Node2D
var leaf = load("res://scenes/leaf.tscn")
var branch = load("res://scenes/plantbranch.tscn")
var piece = load("res://scenes/plant_piece.tscn")
var can_wither = false
var leaves = 0
func _on_stem_grower_spawnleaf():
	var flip = randi_range(0,1)
	var new_leaf = leaf.instantiate()
	if flip == 1:
		new_leaf.scale.x = -1
	new_leaf.position = $Path2D/StemGrower.position
	new_leaf.name = "Leaf"
	add_child(new_leaf)
	leaves+=1
	print(leaves)

func _on_stem_grower_spawnbranch(pos):
	var flip = randi_range(0,1)
	var new_branch = branch.instantiate()
	new_branch.position = pos
	if flip == 1:
		new_branch.scale.x = -1
	add_child(new_branch)

func _process(delta):
	if leaves == 0 and can_wither:
		wither()

func _on_stem_grower_spawnpiece():
	var new_stem = piece.instantiate()
	var heightratio = 1-$Path2D/StemGrower.progress_ratio
	new_stem.position = $Path2D/StemGrower.position
	new_stem.scale = Vector2(heightratio,heightratio)
	add_child(new_stem)

func wither():
	for node in get_children():
		if is_instance_valid(node):
			if node.is_in_group("witherable"):
				node.wither()
				await get_tree().create_timer(.01).timeout
			else:
				node.queue_free()
