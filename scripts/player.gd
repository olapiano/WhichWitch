class_name Player extends CharacterBody2D

var moving_direction := Vector2.ZERO

@export var moving_speed := 100.0
@onready var sprite: Sprite2D = $PlayerSprite


signal shoot(rotation: float, position: Vector2, offset: float)


func _physics_process(_delta: float) -> void:
	moving_direction = Input.get_vector("left", "right", "up", "down")
	velocity = moving_direction * moving_speed
	move_and_slide()
	update_attacking_direction()
	if Input.is_action_just_pressed("attack"):
		shoot.emit(rotation, position, sprite.get_rect().size.x / 2)
	

func update_attacking_direction() -> void:
	var direction := get_global_mouse_position() - global_position
	rotation = direction.angle()
	
