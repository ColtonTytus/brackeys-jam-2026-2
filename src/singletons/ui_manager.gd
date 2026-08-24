extends CanvasLayer

@onready var hud: Control = $HUD
@onready var main: Control = $Main
@onready var pause: Control = $Pause
@onready var game_over: Control = $GameOver
@onready var settings: Control = $Settings
@onready var credits: Control = $Credits
@onready var victory: Control = $Victory
@onready var SFX_BUS_ID = AudioServer.get_bus_index("SFX")
@onready var MUSIC_BUS_ID = AudioServer.get_bus_index("Music")
var in_game : bool = false
var is_paused : bool = false

func _ready() -> void:
	AudioServer.set_bus_volume_db(SFX_BUS_ID, linear_to_db(0.75))
	AudioServer.set_bus_volume_db(MUSIC_BUS_ID, linear_to_db(0.75))


func _on_start_pressed() -> void:
	in_game = true
	main.visible = false
	hud.visible = true
	EventBus.ui_start_game.emit()


func _on_settings_pressed() -> void:
	main.visible = false
	pause.visible = false
	settings.visible = true


func _on_credits_pressed() -> void:
	main.visible = false
	pause.visible = false
	credits.visible = true


func _on_exit_pressed() -> void:
	EventBus.ui_exit.emit()


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause") and is_paused == false:
		EventBus.ui_pause.emit()
		hud.visible = false
		pause.visible = true
		is_paused = true
	elif Input.is_action_just_pressed("pause") and is_paused == true:
		resume()


func _on_sfx_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(SFX_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(SFX_BUS_ID, value < 0.05)


func _on_music_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(MUSIC_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(MUSIC_BUS_ID, value < 0.05)


func _on_settings_return_pressed() -> void:
	settings.visible = false
	if in_game == false:
		main.visible = true
	if in_game == true:
		hud.visible = false
		pause.visible = true


func _on_credits_return_pressed() -> void:
	credits.visible = false
	if in_game == false:
		main.visible = true
	if in_game == true:
		pause.visible = true


func _on_resume_pressed() -> void:
	resume()


func _on_back_to_main_pressed() -> void:
	in_game = false
	hud.visible = false
	pause.visible = false
	main.visible = true
	EventBus.ui_back_to_menu.emit()


func resume():
	is_paused = false
	settings.visible = false
	credits.visible = false
	pause.visible = false
	hud.visible = true
	EventBus.ui_resume.emit()
