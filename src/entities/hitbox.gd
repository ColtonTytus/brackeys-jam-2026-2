class_name HitBox extends Area2D

signal hit(damage: float)

func _init() -> void:
	set_collision_mask_value(6, true)

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is Projectile:
		hit.emit(body.damage)
		body.destroy(true)
