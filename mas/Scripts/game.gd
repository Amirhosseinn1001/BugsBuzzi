extends Node2D

@onready var music = AudioStreamPlayer.new()

func _ready():
	# Add intro scene
	var intro = preload("res://Scenes/IntroScreen.tscn").instantiate()
	add_child(intro)

	# Setup background music
	music.stream = load("res://Audio/background_music_1.ogg")
	music.volume_db = 0
	music.stream.set_loop(true)
	add_child(music)
	music.play()
