extends Node2D

var Laser = preload("res://Projectiles/PlayerLaser.tscn")

var score = 0
var health = 5

func _on_Player_spawn_laser(location):
	var l = Laser.instance()
	l.global_position = location
	add_child(l)

func score():
	score += 1
	$Score.text = "SCORE: " + str(score)
	if score == 300:
		get_tree().change_scene("res://Win.tscn")
