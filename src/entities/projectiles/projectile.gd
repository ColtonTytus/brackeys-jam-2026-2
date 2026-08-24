class_name Projectile extends CharacterBody2D

@export var speed := 2000.0
@export var direction := Vector2.RIGHT

func _physics_process(_delta: float) -> void:
	velocity = direction * speed
	move_and_slide()
