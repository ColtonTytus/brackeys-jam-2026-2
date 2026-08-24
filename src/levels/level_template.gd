class_name Level extends Node2D

func _ready() -> void:
	ContextManager.push(ContextManager.GAMEPLAY)
	GameManager.level_root = self
	print("Level Ready")

func _exit_tree() -> void:
	ContextManager.pop(ContextManager.GAMEPLAY)

func level_cleared():
	EventBus.emit_signal("level_cleared")
