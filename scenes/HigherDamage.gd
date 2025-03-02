extends Button
@export var cost : int
var t = 0
func _process(delta):
	if GlobalVar.money >= cost:
		flicker()
	if GlobalVar.damage>= 8:
		disabled = true
func flicker():
	modulate = Color(1,1,1,t)
	if t < 1:
		t+=.005

