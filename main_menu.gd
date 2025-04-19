extends Control


func _on_start_pressed() -> void:
	print("Start pressed!")
	# the scene that occcurs when we press start will be
	# implemented by using this: get_tree().change_scene_to_file("path to next scene")


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Credits.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
