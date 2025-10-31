extends PathFollow2D

@export var speed: float = 10.0
@export var loop_path: bool = true

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var last_x: float

func _ready():
	# Store initial position to compare direction
	last_x = global_position.x

func _process(delta: float) -> void:
	# Move along the path
	progress += speed * delta

	# If loop_path is enabled, restart when reaching the end
	if loop_path and progress_ratio >= 1.0:
		progress = 0

	# Determine current movement direction
	var current_x = global_position.x

	if current_x > last_x:
		sprite.play("right")
	elif current_x < last_x:
		sprite.play("left")

	# Save this position for the next frame
	last_x = current_x
