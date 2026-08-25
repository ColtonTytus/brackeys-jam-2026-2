class_name Projectile extends CharacterBody2D

@export var damage := 10.0
@export var speed := 2000.0
@export var direction := Vector2.RIGHT

func _init() -> void:
	set_collision_layer_value(6, true)
	set_collision_mask_value(2, true)

func _physics_process(_delta: float) -> void:
	velocity = direction * speed
	move_and_slide()

func destroy(hit_someone := false) -> void:
	queue_free()
