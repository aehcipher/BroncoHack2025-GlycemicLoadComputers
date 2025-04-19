extends Control


func _on_backToMenu_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
