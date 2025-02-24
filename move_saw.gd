extends Node2D
@export var point_a: Vector2
@export var point_b: Vector2
@export var speed: float = 100.0
@export var rotation_speed = 200
var target: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target=point_b


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position=position.move_toward(target, speed*delta)
	if position.distance_to(target)<1.0:
		if target==point_b:
			target=point_a
		else:
			target=point_b
	get_child(0).rotation_degrees += rotation_speed*delta
