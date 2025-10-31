extends PathFollow2D

@export var speed: float = 20.0
@export var loop_path: bool = true

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var last_x: float
var last_y: float

func _ready():
	# Store initial position to compare direction
	last_x = global_position.x
	last_y = global_position.y

func _process(delta: float) -> void:
	# Move along the path
	progress += speed * delta

	# If loop_path is enabled, restart when reaching the end
	if loop_path and progress_ratio >= 1.0:
		progress = 0

	# Determine current movement direction
	var current_x = global_position.x
	var current_y = global_position.y

	if current_x > last_x:
		sprite.play("right")
	elif current_x < last_x:
		sprite.play("left")
	elif current_y < last_y:
		sprite.play("up")
	elif current_y > last_y:
		sprite.play("down")

	# Save this position for the next frame
	last_x = current_x
	last_y = current_y
