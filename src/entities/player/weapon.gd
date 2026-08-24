extends PlayerController

@export var _weapon_axis: Node2D
@export var weapon_distance := 128.0

var _weapon: Weapon = null

func _process(_delta: float) -> void:
	if _weapon == null:
		return
	
	var relative_mouse_pos := player.get_local_mouse_position()
	var angle := atan2(relative_mouse_pos.y, relative_mouse_pos.x)
	_weapon_axis.rotation = angle
	
	if absf(angle) >= PI / 2.0:
		_weapon.scale.y = -1.0
	else:
		_weapon.scale.y = 1.0
	
	var distance := relative_mouse_pos.length()
	_weapon.position.x = clampf(distance - _weapon.tip.position.x, 0.0, weapon_distance)

func _input(_event: InputEvent) -> void:
	if _weapon == null:
		return
	
	if Input.is_action_just_pressed("fire01"):
		_weapon.attack_primary()
	
	if Input.is_action_just_pressed("fire02"):
		_weapon.attack_secondary()

func _on_weapon_pickup(weapon: Weapon) -> void:
	_weapon = weapon
