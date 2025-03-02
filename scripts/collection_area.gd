extends Area2D

func _on_body_entered(body):
	if body.is_in_group("leaf"):
		body.queue_free()
		GlobalVar.is_something_held = false
		$Collect.play()
		GlobalVar.tutorial = false
		GlobalVar.money += 1



