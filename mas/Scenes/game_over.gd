extends CanvasLayer

#@onready var restart_button: Button = $VBoxContainer/RestartButton
#@onready var quit_button: Button = $VBoxContainer/QuitButton
@onready var restart_button: Button = $VBoxContainer/RestartButton
@onready var quit_button: Button = $VBoxContainer/QuitButton

func _ready() -> void:
	restart_button.pressed.connect(_on_restart_button_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

#func _on_restart_pressed() -> void:
	#get_tree().paused = false
	#get_tree().reload_current_scene()
	#print("restart pressed")



func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_restart_button_pressed() -> void:
	print("restart pressed")
	get_tree().paused = false
	Globals.POPULATION = 100
	Globals.MONEY = 10
	get_tree().reload_current_scene()
