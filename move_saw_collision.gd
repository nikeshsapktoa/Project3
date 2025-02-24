extends Area2D

signal player_hit
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()
		player_hit.emit()
		print("Player hit by saw")
