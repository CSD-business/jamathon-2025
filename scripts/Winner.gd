extends RichTextLabel

var t = 0
var won


func _process(delta):
	if won:
		modulate = Color(.5,.5,.5,t)
		t+=.02
func _on_upgrades_win():
	reveal()
	set_text("
		[tornado][center] great work
		" + 
		"you took " + str(Time.get_ticks_msec()/1000) + " seconds" + 
		"
		
		
		by lilli_csd")

func reveal():
	won = true
