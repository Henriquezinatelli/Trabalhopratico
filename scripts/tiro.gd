extends Area2D

var direcao := 1
@export var velocidade := 45.0

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _physics_process(delta: float) -> void:
	global_position.x += direcao * velocidade * delta
	if global_position.x < -40 or global_position.x > 1640:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.perder_vida()
		queue_free()
