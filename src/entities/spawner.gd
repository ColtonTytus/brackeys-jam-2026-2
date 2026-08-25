class_name Spawner extends Node2D

@export var entity: PackedScene = null

func _ready() -> void:
	var instance := entity.instantiate()
	instance.global_position = global_position
	
	owner.add_child.call_deferred(instance)
