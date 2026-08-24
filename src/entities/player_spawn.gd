class_name PlayerSpawn extends Node2D

const PLAYER := preload("uid://c6sytg3wwng7u")

func _ready() -> void:
	var player: PlayerCharacter = PLAYER.instantiate()
	player.global_position = global_position
	
	owner.add_child.call_deferred(player)
