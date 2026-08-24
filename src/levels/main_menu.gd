extends Control

const SETTINGS_MENU := preload("uid://dnxuw2yw7gevl")

@export_file var first_level := ""

func _on_start_pressed() -> void:
	GameManager.change_level(first_level)

func _on_settings_pressed() -> void:
	add_child(SETTINGS_MENU.instantiate())

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://src/levels/credits.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
