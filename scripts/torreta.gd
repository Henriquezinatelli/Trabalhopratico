extends Node2D

@export var intervalo := 5.0
var tempo := 2.0

func _process(delta: float) -> void:
	tempo -= delta
	if tempo <= 0:
		tempo = intervalo
		var player = get_parent().get_node_or_null("Player")
		if player and abs(player.global_position.x - global_position.x) < 220:
			var tiro = preload("res://cenas/Tiro.tscn").instantiate()
			tiro.global_position = global_position + Vector2(10, 0)
			tiro.direcao = -1 if player.global_position.x < global_position.x else 1
			get_parent().add_child(tiro)
