extends Control

@onready var master_bus := AudioServer.get_bus_index("Master")
@onready var music_bus := AudioServer.get_bus_index("Music")
@onready var sfx_bus := AudioServer.get_bus_index("SFX")

@onready var music_volume: Range = $options/MusicVolumeSlider
@onready var sfx_volume: Range = $options/SFXVolumeSlider

func _ready() -> void:
	music_volume.value = AudioServer.get_bus_volume_linear(music_bus)
	sfx_volume.value = AudioServer.get_bus_volume_linear(sfx_bus)

func _on_music_volume_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(music_bus, value)

func _on_sfx_volume_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(sfx_bus, value)

func _on_return_pressed() -> void:
	queue_free()
