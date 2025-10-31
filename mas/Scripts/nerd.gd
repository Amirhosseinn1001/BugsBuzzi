extends CharacterBody2D

@onready var timer: Timer = $Timer
@export var max_health: int = 400
const SPEED = 150
var changed_direction = false
var health: int
var damage = 2
var direction = 0
var can_move = true
var changed
@onready var popup: Popup = $Popup  # must exist in the scene tree
signal clicked

func _ready() -> void:
	health = max_health
	timer.wait_time = randf_range(0.5, 1.5)
	popup.hide()  # hide by default
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func take_damage(amount: int) -> void:
	health -= amount
	animated_sprite.modulate = Color(1,0,0)   # red tint
	await get_tree().create_timer(0.05).timeout
	animated_sprite.modulate = Color(1,1,1) 
	if health <= 0:
		die()

func die() -> void:
	print("Enemy died!")
	Globals.MONEY += 1
	Globals.EEPOPULATION-=1
	queue_free()

func move(delta: float) -> void:
	if direction == 0:
		position.x -= SPEED * delta
	else:
		position.y -= SPEED * delta

func _process(delta: float) -> void:
	if can_move:
		move(delta)

func change_direction() -> void:
	direction = int(!bool(direction))
	changed_direction = true

func _on_timer_timeout() -> void:
	change_direction()

func Change():
	changed = true

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MouseButton.MOUSE_BUTTON_LEFT:
		take_damage(50)
		print("took damage")
		#var offset = Vector2(40, -20)  # adjust for where you want it
		#popup.position = self.position + offset
		#popup.popup()
