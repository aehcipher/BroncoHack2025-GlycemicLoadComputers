extends Control


func _on_start_pressed() -> void:
	print("Start pressed!")
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Credits.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
