extends Node

@onready var music = AudioStreamPlayer.new()

func _ready():
	print("🎵 MusicPlayer is running!")  # test message

	music.stream = load("res://Audio/background_music_1.ogg")  # change path if needed
	if music.stream == null:
		print(" Could not load music stream!")
		return

	music.volume_db = 0
	music.loop = true
	add_child(music)
	music.play()
	print(" Music started:", music.playing)
