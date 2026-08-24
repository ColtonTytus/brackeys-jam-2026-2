extends Node

enum Context {
	GAMEPLAY,
	CUTSCENE,
	DIALOGUE,
	PAUSED,
}

signal changed(new_ctx: Context)

var _stack: Array[Context] = []

func _init() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func current() -> Context:
	var back = _stack.back()
	return back if back else Context.GAMEPLAY

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
