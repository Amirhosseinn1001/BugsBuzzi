extends Node2D

@onready var music = AudioStreamPlayer.new()

@onready var spawn: Area2D = $spawn

func _ready():
	# Add intro scene
	var intro = preload("res://Scenes/IntroScreen.tscn").instantiate()
	add_child(intro)
	spawn.timer.start()

	# Setup background music
	music.stream = load("res://Audio/background_music_1.ogg")
	music.volume_db = 0
	music.stream.set_loop(true)
	add_child(music)
	music.play()
