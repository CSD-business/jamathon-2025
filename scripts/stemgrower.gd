extends PathFollow2D

@export var Leaf : Node
var abundance = randi_range(18,30)
var counter = 0
var fertility = randi_range(3,5)
signal spawnleaf
signal spawnbranch
signal spawnpiece

func _init():
	print(abundance)
	
func _process(delta):
	if randi_range(0,16) > 1:
		grow()
		
func grow():
	var growth_ratio = 1-progress_ratio
	progress += 1
	counter+=1
	spawnpiece.emit()
	if counter % abundance == 0:
		spawnleaf.emit()
	if progress_ratio > .3 and randi_range(1,20) == 1 and fertility > 1:
		spawnbranch.emit(position)
		fertility -= 1
	if progress_ratio>.8: queue_free()
	
