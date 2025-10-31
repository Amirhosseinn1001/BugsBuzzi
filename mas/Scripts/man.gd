extends CharacterBody2D

@onready var timer: Timer = $Timer
@export var max_health: int = 1000
const SPEED = 100
var changed_direction = false
var health: int

func _ready() -> void:
	health = max_health
	timer.wait_time = randf_range(0.5, 1.5)

func take_damage(amount: int) -> void:
	health -= amount
	#print(name + " took damage! Health now:", health)
	if health <= 0:
		die()

func die() -> void:
	print("Enemy died!")
	queue_free()

func move(delta: float) -> void:
	if direction == 0:
		position.x -= SPEED * delta  # move left
	else:
		position.y -= SPEED * delta  # move up
var direction = 0  # 0 = move left, 1 = move up

func _process(delta: float) -> void:
	move(delta)
	#print(position)

func change_direction() -> void:
	#print(name + " direction changed")
	direction = int(!bool(direction))  # toggles between 0 and 1
	changed_direction = true

func _on_timer_timeout() -> void:
	change_direction()
