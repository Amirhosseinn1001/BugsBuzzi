extends CanvasLayer

@onready var EEpop_label = $PanelContainer/HBoxContainer/EE_pop
@onready var CEpop_label = $PanelContainer/HBoxContainer/CE_pop
@onready var Card_label = $PanelContainer/HBoxContainer/card

# Keep track of last values to avoid unnecessary updates
var last_ee_pop = -1
var last_ce_pop = -1
var last_money = -1

func _process(delta):
	update_labels()

func update_labels():
	# Only update if values changed
	if last_ee_pop != Globals.POPULATION:
		EEpop_label.text = "👥 Population: %d" % Globals.POPULATION
		last_ee_pop = Globals.POPULATION

	if last_ce_pop != Globals.EEPOPULATION:
		CEpop_label.text = "👥 Population: %d" % Globals.EEPOPULATION
		last_ce_pop = Globals.EEPOPULATION

	if last_money != Globals.MONEY:
		Card_label.text = "💰 Money: $%d" % Globals.MONEY
		last_money = Globals.MONEY
