extends Node2D

var baterias := 0
var total_baterias := 5
var tempo := 240.0
var encerrado := false

func _ready() -> void:
	atualizar_hud()

func _process(delta: float) -> void:
	if encerrado:
		return
	tempo -= delta
	if tempo <= 0:
		tempo = 0
		derrota()
	atualizar_hud()

func bateria_coletada() -> void:
	baterias += 1
	atualizar_hud()

func checar_vitoria() -> void:
	if baterias == total_baterias:
		encerrado = true
		$HUD/Mensagem.text = "PARABÉNS!\nMISSÃO CONCLUÍDA!"
		$HUD/Mensagem.visible = true
	else:
		$HUD/Mensagem.text = "Ainda faltam %d baterias!" % (total_baterias - baterias)
		$HUD/Mensagem.visible = true
		await get_tree().create_timer(1.2).timeout
		if not encerrado:
			$HUD/Mensagem.visible = false

func derrota() -> void:
	if encerrado:
		return
	encerrado = true
	$HUD/Mensagem.text = "FIM DE JOGO\nPressione R para reiniciar"
	$HUD/Mensagem.visible = true

func atualizar_hud() -> void:
	$HUD/Baterias.text = "Baterias: %d/5" % baterias
	$HUD/Vidas.text = "Vidas: %d" % $Player.vidas
	$HUD/Tempo.text = "Tempo: %03d" % int(ceil(tempo))

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_R:
		get_tree().reload_current_scene()
