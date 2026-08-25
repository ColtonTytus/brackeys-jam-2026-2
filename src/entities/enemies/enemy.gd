class_name Enemy extends CharacterBody2D

@export var health := 100.0
@export var hitbox: HitBox = null

func _init() -> void:
	set_collision_layer_value(5, true)
	set_collision_mask_value(2, true)
