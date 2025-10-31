extends Area2D

@export var man_scene: PackedScene
@export var woman_scene: PackedScene
@export var nerd_scene: PackedScene        # drag your enemy.tscn here in the Inspector
@export var spawn_interval: float = 2.0     # seconds between spawns
@export var max_enemies: int = 10           # how many enemies can exist at once
@export var spawn_area_size: Vector2 = Vector2(300, 200)  # width/height of spawn zone
@onready var timer: Timer = Timer.new()
var active_enemies: Array = []

func _ready() -> void:
	randomize()
	add_child(timer)
	timer.wait_time = spawn_interval
	timer.timeout.connect(_on_timer_timeout)
	#timer.start()


func _on_timer_timeout() -> void:
	active_enemies = active_enemies.filter(func(e): return is_instance_valid(e))
	if active_enemies.size() >= max_enemies:
		return

	var enemy_scene
	var r = randi_range(0, 2)
	if r == 0:
		enemy_scene = man_scene
	elif r == 1:
		enemy_scene = woman_scene
	else:
		enemy_scene = nerd_scene

	var enemy = enemy_scene.instantiate()
	enemy.position = get_random_point_in_area()
	enemy.scale *= 2
	
	print("enemy spawned")
	print(enemy.position)
	get_parent().add_child(enemy)
	active_enemies.append(enemy)
	timer.wait_time = randf_range(0.5, 3.0)
	timer.start()


func get_random_point_in_area() -> Vector2:
	var shape = $CollisionShape2D.shape
	var transform = $CollisionShape2D.global_transform

	if shape is RectangleShape2D:
		var half = shape.size / 2
		var local_pos = Vector2(
			randf_range(-half.x, half.x),
			randf_range(-half.y, half.y)
		)
		return transform.origin + local_pos

	elif shape is CircleShape2D:
		var angle = randf() * TAU
		var radius = randf() * shape.radius
		var local_pos = Vector2(cos(angle), sin(angle)) * radius
		return transform.origin + local_pos

	return transform.origin
