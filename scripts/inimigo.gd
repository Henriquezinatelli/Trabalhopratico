extends Area2D

@export var distancia := 20.0
@export var velocidade := 12.0
var inicio := 0.0
var direcao := 1.0

func _ready() -> void:
	inicio = global_position.x
	body_entered.connect(_on_body_entered)

func _physics_process(delta: float) -> void:
	global_position.x += direcao * velocidade * delta
	if global_position.x > inicio + distancia:
		direcao = -1.0
	elif global_position.x < inicio - distancia:
		direcao = 1.0

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.perder_vida()
