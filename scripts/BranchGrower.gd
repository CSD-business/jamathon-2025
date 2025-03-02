extends PathFollow2D
@export var StemArt = "res://textures/white_vine.png"
@export var Leaf : Node
var abundance = randi_range(50,80)
var counter = 0
signal spawnleaf
signal spawnbranch
signal spawnpiece

func _init():
	pass
	
func _process(delta):
	if randi_range(0,16) > 1:
		grow()
		
func grow():
	var growth_ratio = 1-progress_ratio
	var new_stem = Sprite2D.new()
	progress += 1
	new_stem.texture = load(StemArt)
	new_stem.position = position
	new_stem.scale = Vector2(growth_ratio/2,growth_ratio/2)
	add_sibling(new_stem)
	counter+=1
	if counter % abundance == 0:
		spawnleaf.emit()
	if progress_ratio>.3: queue_free()
	
