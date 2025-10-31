extends Node2D

func _ready():
	var intro = preload("res://Scenes/IntroScreen.tscn").instantiate()
	add_child(intro)
