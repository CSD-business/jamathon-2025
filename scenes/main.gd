extends Node2D


func _on_collection_area_body_entered(body):
	body.queue_free()
