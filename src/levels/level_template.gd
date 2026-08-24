extends Node2D

@onready var spawn_locator: Node2D = $SpawnLocator
@onready var spawn_position = spawn_locator.position
var level_index : int

func _ready() -> void:
	print("Level Ready")

func level_cleared():
	EventBus.emit_signal("level_cleared")
