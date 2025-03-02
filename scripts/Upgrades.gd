extends Control
signal win

func _on_faster_growth_pressed():
	if GlobalVar.money >= 3:
		GlobalVar.money -=3
		GlobalVar.growth_rate *= 1.2
		$Success.play()
	else: $Fail.play()

func _on_higher_damage_pressed():
	if GlobalVar.money >= 1:
		GlobalVar.money -= 1
		GlobalVar.damage *= 1.2
		$Success.play()
	else: $Fail.play()
	
func _on_more_acorns_pressed():
	if GlobalVar.money >= 1:
		GlobalVar.money -= 1
		GlobalVar.acorn_chance += 1
		$Success.play()
	else: $Fail.play()

func _on_victory_pressed():
	if GlobalVar.money >= 1:
		GlobalVar.money -= 50
		win.emit()
		$Success.play()
	else: $Fail.play()
