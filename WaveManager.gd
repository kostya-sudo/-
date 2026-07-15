extends Node


var enemy_scene = preload("res://Enemy.tscn")


var wave = 1
var enemies_to_spawn = 5


func start():

	start_wave()



func start_wave():

	print("Началась волна ", wave)

	for i in range(enemies_to_spawn):

		spawn_enemy()

		await get_tree().create_timer(1).timeout


func spawn_enemy():

	var enemy = enemy_scene.instantiate()

	var x = randi_range(50,1000)
	var y = randi_range(50,1800)

	enemy.position = Vector2(x,y)

	get_parent().get_node("Enemies").add_child(enemy)



func next_wave():

	wave += 1

	enemies_to_spawn += 3

	start_wave()
