extends Control

@onready var start_button: Button = $StartButton
@onready var quit_button: Button = $QuitButton

func _ready() -> void:
	start_button.pressed.connect(_on_start_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

func _on_start_pressed() -> void:
	# Load the main game scene
	var main_scene = preload("res://Scenes/game.tscn").instantiate()
	get_tree().current_scene.queue_free()  # remove start menu
	get_tree().root.add_child(main_scene)
	get_tree().current_scene = main_scene  # set new current scene

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_line_edit_text_submitted(new_text: String) -> void:
	Globals.code = new_text
