extends Node

var level_root: Node = null
var player_character: PlayerCharacter = null

func change_level(path: String) -> void:
	get_tree().change_scene_to_file(path)
