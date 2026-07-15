extends CharacterBody2D


var speed = 120
var health = 3

var player


func _ready():

	player = get_tree().get_first_node_in_group("player")


func _physics_process(delta):

	if player:

		var direction = position.direction_to(player.position)

		velocity = direction * speed

		move_and_slide()


func take_damage(damage):

	health -= damage

	if health <= 0:

		die()


func die():

	var world = get_parent().get_parent()

	if world.has_method("add_artifact"):
		world.add_artifact(1)

	queue_free()


func _on_body_entered(body):

	if body.is_in_group("player"):

		body.take_damage()
