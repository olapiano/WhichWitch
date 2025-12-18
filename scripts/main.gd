extends Node

var attack_scene: Resource = preload("res://scenes/attack.tscn")

func _on_player_shoot(rotation: float, direction: Vector2, offset: float) -> void:
	var attack = attack_scene.instantiate() as Area2D
	attack.setup(rotation, direction, offset)
	$Attacks.add_child(attack)
