extends Node

enum Context {
	MENU,
	GAMEPLAY,
	CUTSCENE,
	DIALOGUE,
	PAUSED,
}

signal changed(new_ctx: Context)

const MENU := Context.MENU
const GAMEPLAY := Context.GAMEPLAY
const CUTSCENE := Context.CUTSCENE
const DIALOGUE := Context.DIALOGUE
const PAUSED := Context.PAUSED

var _stack: Array[Context] = []

func _init() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func current() -> Context:
	if _stack.is_empty():
		return Context.MENU
	else:
		return _stack.back()

func push(ctx: Context) -> void:
	_stack.append(ctx)
	changed.emit(current())
	_apply_current()

func pop(ctx: Context) -> void:
	if current() == ctx:
		_stack.pop_back()
		changed.emit(current())
		_apply_current()

func _apply_current() -> void:
	var cur := current()
	
	get_tree().paused = cur == Context.PAUSED
