extends Area2D

var speed := 400.0
var direction: Vector2
var starting_position: Vector2
var max_distance: float = 500

func setup(entity_rotation: float, entity_position: Vector2, offset: float):
	rotation = entity_rotation
	direction = Vector2.RIGHT.rotated(rotation)
	starting_position = entity_position + direction * offset
	position = starting_position

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	if position.distance_to(starting_position) >= max_distance:
		queue_free()
