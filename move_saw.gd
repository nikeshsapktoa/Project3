extends Node2D

@export var move_distance: float = 200  # Distance to move left/right
@export var speed: float = 100.0  # Speed of movement
@export var rotation_speed: float = 3000  # Rotation speed

var start_position: Vector2
var target: Vector2
var moving_to_b = true

func _ready() -> void:
	start_position = position  # Store the original position
	target = start_position + Vector2(move_distance, 0)  # Move to the right first

func _process(delta: float) -> void:
	# Move the saw toward the target
	position = position.move_toward(target, speed * delta)
	
	# If the saw reaches the target, switch direction
	if position.distance_to(target) < 1.0:
		moving_to_b = !moving_to_b
		target = start_position + Vector2(move_distance if moving_to_b else -move_distance, 0)

	# Keep the saw spinning
	get_child(0).rotation_degrees += rotation_speed * delta
