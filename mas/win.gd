extends CanvasLayer

@onready var restart_button: Button = $restart
@onready var quit_button: Button = $quit

func _ready() -> void:
	restart_button.pressed.connect(_on_restart_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

#func _on_restart_pressed() -> void:
	#get_tree().paused = false
	#get_tree().reload_current_scene()
	#print("restart pressed")



func _on_quit_pressed() -> void:
	get_tree().quit()



func _on_restart_pressed() -> void:
	print("restart pressed")
	get_tree().paused = false
	Globals.POPULATION = 100
	Globals.EEPOPULATION = 50
	Globals.MONEY = 10
	get_tree().reload_current_scene()
