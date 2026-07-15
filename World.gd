extends Node2D

var artifacts = 0
var wave = 1

func _ready():
	print("Последний бункер запущен")
	start_wave()


func start_wave():
	print("Волна: ", wave)


func add_artifact(amount):
	artifacts += amount
	
	$CanvasLayer/Score.text = "Артефакты: " + str(artifacts)


func next_wave():
	wave += 1
	start_wave()
