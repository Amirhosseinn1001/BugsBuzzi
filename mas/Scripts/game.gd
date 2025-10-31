extends Node2D

@onready var music = AudioStreamPlayer.new()

@onready var spawn: Area2D = $spawn
#var intro_screen: CanvasLayer
func _ready():
	# Add intro scene
	var intro = preload("res://Scenes/IntroScreen.tscn").instantiate()
	add_child(intro)
	#intro_screen = intro
	#intro.intro_finished.connect(_on_intro_finished)
	# Setup background music
	music.stream = load("res://Audio/background_music_1.ogg")
	music.volume_db = 0
	music.stream.set_loop(true)
	add_child(music)
	music.play()

#func _process(delta: float) -> void:
	#if something.get("current_index") != null:
		#if(something.current_index == something.dialogue.size()):
			#something.current_index += 1
			#spawn.timer.start()
func _on_intro_finished():
	# 2. When the signal is received, start the spawn timer
	# You must call the timer.start() function on the Area2D script's timer.
	if is_instance_valid(spawn) and is_instance_valid(spawn.timer):
		spawn.timer.start()
