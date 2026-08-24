extends CharacterBody2D


var speed = 500.0
@export var max_health : float = 100
var cur_health : float = max_health
@export var max_mana : float = 100
var cur_mana : float = max_mana

func _ready() -> void:
	print("Player Ready")
	pass


func _physics_process(_delta: float) -> void:
	var direction : Vector2 = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()
