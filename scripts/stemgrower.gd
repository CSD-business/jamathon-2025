extends PathFollow2D
@export var StemArt = "res://textures/white_vine.png"

var abundance = randi_range(13,26)
var counter = 0

func _init():
	print(abundance)
func _process(delta):
	if randi_range(0,16) == 1:
		grow()
		
func grow():
	var growth_ratio = 1-progress_ratio
	
	var new_stem = Sprite2D.new()
	progress_ratio += .01
	new_stem.texture = load(StemArt)
	new_stem.position = position
	new_stem.scale = Vector2(growth_ratio,growth_ratio)
	add_sibling(new_stem)
	counter+=1
	if counter % abundance == 0:
		#add_sibling(leaf)
		print("we made a leaf")
	if progress_ratio>.8: queue_free()
	
