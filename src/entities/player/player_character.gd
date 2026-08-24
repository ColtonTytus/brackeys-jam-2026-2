class_name PlayerCharacter extends CharacterBody2D

@export var max_health := 100.0
@export var max_mana := 100.0

var cur_health := max_health
var cur_mana := max_mana

func _ready() -> void:
	GameManager.player_character = self
