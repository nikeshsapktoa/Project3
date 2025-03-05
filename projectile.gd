extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction := Vector2.ZERO

func _physics_process(delta: float) -> void:
	velocity= direction * SPEED
	move_and_slide()
	var motion = direction * SPEED * delta
	var collision = move_and_collide(motion)
	if collision:
		var collider = collision.get_collider()
		if collider and collider.is_in_group("Player"):
			print("player hit!")
			collider.kill()
			queue_free()
func _on_timer_timeout() -> void:
	queue_free()
