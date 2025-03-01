extends Node2D

func _physics_process(delta):
	$StaticBody2D.position = get_local_mouse_position()
