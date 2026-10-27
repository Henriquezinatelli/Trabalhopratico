
extends CharacterBody2D

const SPEED := 90.0
const GRAVITY := 200.0
const JUMP := -135.0

var vidas := 5
var spawn := Vector2.ZERO
var invulneravel := 0.0

func _ready() -> void:
	spawn = global_position

func _physics_process(delta: float) -> void:
	var fase = get_parent()

	if fase.get("encerrado") == true:
		velocity = Vector2.ZERO
		return

	if invulneravel > 0:
		invulneravel -= delta

	var dir := Input.get_axis("ui_left", "ui_right")
	velocity.x = dir * SPEED

	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.y = 0

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP

	move_and_slide()

	if dir != 0:
		$AnimatedSprite2D.flip_h = dir < 0

	if global_position.y > 230:
		perder_vida()

func perder_vida() -> void:
	var fase = get_parent()

	if invulneravel > 0:
		return

	if fase.get("encerrado") == true:
		return

	vidas -= 1
	fase.atualizar_hud()

	if vidas <= 0:
		fase.derrota()
	else:
		global_position = spawn
		velocity = Vector2.ZERO
		invulneravel = 1.5

func curar_vida() -> void:
	vidas = min(5, vidas + 1)
	get_parent().atualizar_hud()
