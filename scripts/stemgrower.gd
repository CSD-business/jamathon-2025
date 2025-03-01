extends PathFollow2D
@export var StemArt = "res://textures/white_vine.png"
@export var Leaf : Node
var abundance = randi_range(18,30)
var counter = 0
var fertility = randi_range(3,5)
signal spawnleaf
signal spawnbranch

func _init():
	print(abundance)
	
func _process(delta):
	if randi_range(0,16) > 1:
		grow()
		
func grow():
	var growth_ratio = 1-progress_ratio
	var new_stem = Sprite2D.new()
	progress += 1
	new_stem.texture = load(StemArt)
	new_stem.position = position
	new_stem.scale = Vector2(growth_ratio,growth_ratio)
	add_sibling(new_stem)
	counter+=1
	if counter % abundance == 0:
		spawnleaf.emit()
	if progress_ratio > .3 and randi_range(1,20) == 1 and fertility > 1:
		spawnbranch.emit(position)
		fertility -= 1
	if progress_ratio>.8: queue_free()
	
