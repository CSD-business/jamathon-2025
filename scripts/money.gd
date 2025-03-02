extends RichTextLabel
var t = 0
func _process(delta):
	if GlobalVar.money == 0:
		set_text("
		[shake][center]No leaves...")
	if GlobalVar.money == 1:
		set_text("
		[shake][center]1 leaf")
	elif GlobalVar.money > 0:
		set_text("
		[shake][center]" + str(snapped(GlobalVar.money,0.01)) + " leaves")
	
	if GlobalVar.tutorial == false:
		flicker()

func flicker():
	modulate = Color(1,1,1,t)
	if t < 1:
		t+=.005
	
