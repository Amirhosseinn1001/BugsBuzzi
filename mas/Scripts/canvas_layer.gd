extends CanvasLayer

# List of messages in the intro
@export var dialogue: Array[String] = [
	"Salam Compie!\nMan 10 ta az barghi ha ro be esarat\ngereftam ta lamp rahro haye\ndaneshkade moono tamir konan...",
	"hahahahahaha...",
	"Man adam bi adabi nistam, vali (kheili\nkheili) bebakhshid in 'divane' ha\nmikhan be ma hamle konan...",
	"Bia yek bar baraye hamishe az\ndasteshoon khalas shim!"
]

# Optional: portraits for each line
@export var portraits: Array[Texture2D] = []

@onready var portrait = $Panel/TextureRect
@onready var text_label = $Panel/Label
@onready var next_button = $Panel/Button

var current_index: int = 0

func _ready():
	text_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	text_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	text_label.autowrap_mode = TextServer.AUTOWRAP_WORD
	
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0, 0, 0, 0.5)
	style.set_corner_radius_all(16)
	$Panel.add_theme_stylebox_override("panel", style)
	
	show_message(current_index)
	next_button.pressed.connect(_on_next_pressed)

func show_message(index: int) -> void:
	if index < dialogue.size():
		text_label.text = dialogue[index]
		if index < portraits.size() and portraits[index]:
			portrait.texture = portraits[index]

func _on_next_pressed() -> void:
	current_index += 1

	if current_index >= dialogue.size():
		hide()

	else:
		show_message(current_index)
