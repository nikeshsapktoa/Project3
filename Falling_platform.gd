extends RigidBody2D
@export var fall_delay: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gravity_scale=0
	freeze=true
	$Area2D.body_entered.connect(_on_area_2d_body_entered)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		await get_tree().create_timer(fall_delay).timeout
		print("player entered")
		freeze=false
		gravity_scale = 1
