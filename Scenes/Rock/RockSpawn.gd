
extends Node

# member variables here, example:
# var a=2
# var b="textvar"

var RockL = preload("res://Scenes/Rock/RockL.scn")
var RockM = preload("res://Scenes/Rock/RockM.scn")
var RockS = preload("res://Scenes/Rock/RockS.scn")

var createRock = false

func _ready():
	set_process(true)
	Globals.set("gameRunning", true)

func _process(delta):
	
	if createRock == true:
		var number = rand_range(0,3)
		if number <= 1:
			var newRock = RockL.instance()
			add_child(newRock)
			newRock.set_owner(self)
		elif number <= 2:
			var newRock = RockM.instance()
			add_child(newRock)
			newRock.set_owner(self)
		elif number <= 3:
			var newRock = RockS.instance()
			add_child(newRock)
			newRock.set_owner(self)
		createRock = false


func _on_Timer_timeout():
	if Globals.get("gameRunning") == true:
		createRock = true
