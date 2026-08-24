class_name ProjectileWeapon extends Weapon

@export var projectile: PackedScene

func attack_primary() -> void:
	var instance: Projectile = projectile.instantiate()
	instance.global_position = tip.global_position
	instance.global_rotation = global_rotation
	
	instance.direction = Vector2(cos(global_rotation), sin(global_rotation))
	
	GameManager.add_child(instance)
