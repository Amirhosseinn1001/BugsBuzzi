extends Area2D

const damage = 200
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
@onready var timer: Timer = $Timer


var bodies_in_area = []



#func _physics_process(delta):
	#for body in bodies_in_area.duplicate():  # iterate over a copy to safely remove
		#if not is_instance_valid(body) or not body.is_inside_tree():
			#bodies_in_area.erase(body)
			#continue
		#body.take_damage(600 * delta)

func _on_timer_timeout() -> void:
	#timer.start()
	for body in get_overlapping_bodies():  # iterate over a copy to safely remove
		if not is_instance_valid(body) or not body.is_inside_tree():
			bodies_in_area.erase(body)
			continue
		body.take_damage(damage)
