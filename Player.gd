extends CharacterBody2D


var speed = 350
var health = 3

var target_position = Vector2.ZERO
var moving = false


func _ready():
	target_position = position


func _physics_process(delta):

	if moving:
		var direction = position.direction_to(target_position)

		if position.distance_to(target_position) > 10:
			velocity = direction * speed
		else:
			velocity = Vector2.ZERO
			moving = false

		move_and_slide()


func _input(event):

	if event is InputEventScreenTouch:

		if event.pressed:
			target_position = event.position
			moving = true


func take_damage():

	health -= 1

	print("Здоровье:", health)

	if health <= 0:
		game_over()


func game_over():

	print("Игрок погиб")

	queue_free()
