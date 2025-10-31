extends PanelContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@onready var ce_pop: Label = $VBoxContainer/CE_pop
@onready var ee_pop: Label = $VBoxContainer/EE_pop

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ce_pop.text ="Compie : " + str(Globals.POPULATION)
	ee_pop.text = "Bargie : " + str(Globals.EEPOPULATION)
