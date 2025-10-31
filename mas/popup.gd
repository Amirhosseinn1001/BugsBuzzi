extends Popup

@onready var button: Button = $Button

func _ready() -> void:
	button.pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	hide()

func Use_ability(body):
	print("Ability used on:", body.name)
	body.Change()
