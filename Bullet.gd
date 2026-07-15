extends Area2D


var speed = 800
var damage = 1
var direction = Vector2.RIGHT


func _physics_process(delta):

	position += direction * speed * delta


func _on_body_entered(body):

	if body.has_method("take_damage"):

		body.take_damage(damage)

		queue_free()


func _ready():

	await get_tree().create_timer(3).timeout

	queue_free()
