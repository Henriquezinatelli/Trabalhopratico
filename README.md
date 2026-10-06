# Robozox: A Missão

Projeto simples de plataforma 2D para Godot 4.

## Controles
- Setas esquerda/direita: movimentar
- Espaço: pular
- R: reiniciar

## Objetivo
Coletar as 5 baterias e chegar ao portal no final da fase.

## Estrutura
Cada objeto importante fica em sua própria cena e possui seu próprio script:

- Player.tscn / player.gd
- Bateria.tscn / bateria.gd
- Inimigo.tscn / inimigo.gd
- Torreta.tscn / torreta.gd
- Tiro.tscn / tiro.gd
- Portal.tscn / portal.gd
- Jogo.tscn / jogo.gd

Não é usado Polygon2D nem AnimatedSprite2D. Os personagens usam Sprite2D simples.
