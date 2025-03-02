extends Node2D


func _on_upgrades_win():
	GlobalVar.max_trees=10
	GlobalVar.growth_rate=100
	GlobalVar.acorn_chance=200
	$Winner.show()

func _input(event):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
