extends Node2D

@onready var music = AudioStreamPlayer.new()

@onready var spawn: Area2D = $spawn
#var intro_screen: CanvasLayer
func _ready():
	$hash.visible = false
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

func generate_hash(solver_group_id: String, private_key: String) -> String:
	var combined := solver_group_id + ":" + private_key
	var raw := combined.sha256_buffer()
	var b64 := Marshalls.raw_to_base64(raw)
	b64 = b64.replace("+", "-").replace("/", "_").replace("=", "")
	if b64.length() >= 10:
		return b64.substr(0, 10)
	else:
		return b64 + "-".repeat(10 - b64.length())


func show_win_screen():
	#var win_scene = preload("res://Scenes/win.tscn").instantiate()
	#win_scene.Label.text = generate_hash(Globals.code,Globals.private_id)
	#get_tree().root.add_child(win_scene)
	$hash.text = generate_hash(Globals.code,Globals.private_id)
	$hash.visible = true
	## Center the Control node (in case it's the root)
	#if win_scene is Control:
		#win_scene.anchor_left = 0.5
		#win_scene.anchor_top = 0.5
		#win_scene.anchor_right = 0.5
		#win_scene.anchor_bottom = 0.5
		#win_scene.position = Vector2.ZERO  # centered at viewport center
		#
	get_tree().paused = true


func _process(delta: float) -> void:
	if Globals.EEPOPULATION <= 0:
		show_win_screen()
func _on_intro_finished():
	# 2. When the signal is received, start the spawn timer
	# You must call the timer.start() function on the Area2D script's timer.
	if is_instance_valid(spawn) and is_instance_valid(spawn.timer):
		spawn.timer.start()
