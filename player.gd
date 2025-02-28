extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var max_jumps: int =1
var jumps_left: int = 1
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
	
	handle_movement_animation(direction)
	
func handle_movement_animation(direction):
	if is_on_floor():
		if !velocity:
			animated_sprite.play("idle")
			if velocity:
				animated_sprite.play("run")
				toggle_flip_sprite(direction)
				
			
func toggle_flip_sprite(direction):
	if direction == 1:
		animated_sprite.flip_h == false
	if direction == -1:
		animated_sprite.flip_h = true
	
	
