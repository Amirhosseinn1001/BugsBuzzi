extends Area2D


@onready var game_over_screen = preload("res://Scenes/GameOver.tscn").instantiate()

func _ready():
	add_child(game_over_screen)
	game_over_screen.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Globals.POPULATION <= 0):
		game_over()
		
func game_over():
	get_tree().paused = true
	game_over_screen.visible = true
	print("you died")



func _on_body_entered(body: Node2D) -> void:
	if body.get("can_move") != null:
		body.can_move = false
		Globals.POPULATION -= body.damage	
	if body.has_node("AnimatedSprite2D"):
		var sprite = body.get_node("AnimatedSprite2D")
		sprite.stop()
		sprite.frame = 0
	if body.changed:
		Globals.POPULATION += body.damage
	body.queue_free()
	
		
