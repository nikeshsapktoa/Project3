extends Area2D

var current_scene: String = ""
func _ready():
	current_scene = get_tree().current_scene.name
	print(current_scene)
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D):
	if body.is_in_group("Player"):
		if current_scene == "level_1":
			get_tree().change_scene_to_file("res://Scences/level_2.tscn")
		elif current_scene == "level_2":
			pass
			#get_tree().change_scene_to_file()
