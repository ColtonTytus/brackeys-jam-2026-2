extends CanvasLayer

const SETTINGS_MENU := preload("uid://dnxuw2yw7gevl")

signal opened
signal closed

func _ready() -> void:
	ContextManager.changed.connect(_on_context_changed)
	close()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		if ContextManager.current() == ContextManager.GAMEPLAY:
			ContextManager.push(ContextManager.PAUSED)
		elif ContextManager.current() == ContextManager.PAUSED:
			ContextManager.pop(ContextManager.PAUSED)

func open() -> void:
	show()
	opened.emit()

func close() -> void:
	hide()
	closed.emit()

func _on_context_changed(ctx: ContextManager.Context) -> void:
	if ctx == ContextManager.PAUSED:
		open()
	else:
		close()

func _on_resume_pressed() -> void:
	ContextManager.pop(ContextManager.PAUSED)

func _on_settings_pressed() -> void:
	var settings_menu: Node = SETTINGS_MENU.instantiate()
	closed.connect(settings_menu.queue_free)
	
	add_child(settings_menu)

func _on_back_to_main_pressed() -> void:
	ContextManager.pop(ContextManager.PAUSED)
	get_tree().change_scene_to_file("uid://fq6l6eoj14wy")
