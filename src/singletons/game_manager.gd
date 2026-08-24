extends Node

@export var player_character : PackedScene
@export var levels : Array[PackedScene] = []
@export var music_tracks : Array[AudioStream] = []

@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var ui_manager: CanvasLayer = $UIManager

var player_instance
var level_instance

var level_index : Dictionary[int, PackedScene]
var music_index : Dictionary[int, AudioStream]


func _ready() -> void:
	pass
	#init_music()
	#init_levels()
	#play_track(0)
	#EventBus.connect("level_cleared", _on_level_cleared)
	#EventBus.connect("player_health_depleted", _on_player_health_depleted)
	#EventBus.connect("ui_start_game", _on_start_game)
	#EventBus.connect("ui_pause", _on_ui_pause)
	#EventBus.connect ("ui_resume", _on_ui_resume)
	#EventBus.connect("ui_exit", _on_exit_pressed)
	#EventBus.connect("ui_back_to_menu", _on_ui_back_to_menu)


func _on_start_game():
	load_level(0, null)
	print(level_instance)
	spawn_player(level_instance.spawn_position)


func _on_exit_pressed():
	print("quitting")
	get_tree().quit()


func load_level(index : int, unloader : Node2D) -> void:
	if unloader != null: unloader.queue_free()
	level_instance = levels[index].instantiate()
	add_child(level_instance)


func spawn_player(position : Vector2):
	if player_instance != null: player_instance.queue_free()
	player_instance = player_character.instantiate()
	player_instance.position = position
	call_deferred("add_child", player_instance)
	print("After spawning: ", player_instance)


func _on_player_health_depleted():
	load_level(level_instance.level_index, level_instance)
	spawn_player(level_instance.spawn_position)

func _on_level_cleared():
	pass


func init_levels():
	for level in range(levels.size()):
		level_index[level] = levels[level]
	print(level_index)


func init_music():
	for song in range(music_tracks.size()):
		music_index[song] = music_tracks[song]
	print(music_index)


func play_track(song_index : int):
	music_player.stream = music_index[song_index]
	music_player.play()


func _on_ui_pause():
	print("On UI Pause: ", player_instance)
	get_tree().paused = true


func _on_ui_resume():
	get_tree().paused = false


func _on_ui_back_to_menu():
	print("before unpausing tree: ", player_instance)
	get_tree().paused = false
	print("After unpausing tree: ", player_instance)
	player_instance.queue_free()
	level_instance.queue_free()
