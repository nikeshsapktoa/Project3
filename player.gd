extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var max_jumps: int =2
var jumps_left: int = 2
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("ui_up") and jumps_left > 0:
		velocity.y = JUMP_VELOCITY
		jumps_left -= 1
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if is_on_floor():
		jumps_left=max_jumps
	move_and_slide()
