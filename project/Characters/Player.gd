extends Area2D
class_name Player

signal spawn_laser(location)

onready var muzzle = $Muzzle

var speed = 400
var input_vector = Vector2.ZERO

var hp = 1
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	print(screen_size)

func _physics_process(delta):
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	global_position += input_vector * speed * delta
	global_position.x = clamp(global_position.x, 0, screen_size.x)
	global_position.y = clamp(global_position.y, 0, screen_size.y)
	
	if Input.is_action_just_pressed("shoot"):
		shoot_laser()

func take_damage(damage):
	hp -= damage
	if hp == 0:
		get_tree().change_scene("res://GameOver.tscn")

func shoot_laser():
	emit_signal("spawn_laser", muzzle.global_position)
