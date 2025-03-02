extends Area2D



func _on_body_entered(body):
	body.queue_free()
	GlobalVar.is_something_held = false
	$Collect.play()
	
