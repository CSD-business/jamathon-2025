extends Node2D

var is_something_held : bool
var growth_rate = 1
var acorn_chance = 2
var damage = 1
var trees = 0
var max_trees = 5
var tutorial = true
var money = 0

func _process(delta):
	if trees < 0:
		trees = 0
