extends Button
@export var cost : int
var t = 0
func _process(delta):
	if GlobalVar.money >= cost:
		flicker()
func flicker():
	modulate = Color(1,1,1,t)
	if t < 1:
		t+=.005


func _on_upgrades_win():
	disabled = true
