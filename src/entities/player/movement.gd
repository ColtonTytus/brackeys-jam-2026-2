extends PlayerController

@export var speed := 500.0

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	
	if direction:
		player.velocity = direction * speed
	else:
		player.velocity = Vector2.ZERO
	
	player.move_and_slide()
