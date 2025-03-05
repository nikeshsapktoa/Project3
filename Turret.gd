extends Node2D
@export var projectile_scene: PackedScene
@export var shoot_interval: float = 1.5
var target: Node2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_shooting()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		target = body
		

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == target:
		target = null
func start_shooting():
	while true:
		if target:
			shoot()
		await get_tree().create_timer(shoot_interval).timeout
func shoot():
	if target:
		var bullet = projectile_scene.instantiate()
		bullet.global_position = $Marker2D.global_position
		bullet.direction = (target.global_position - global_position).normalized()
		get_tree().current_scene.add_child(bullet)
