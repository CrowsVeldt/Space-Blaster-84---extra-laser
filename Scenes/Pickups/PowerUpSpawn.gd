
extends Node

# member variables here, example:
# var a=2
# var b="textvar"

var PowerUp = preload("res://Scenes/Pickups/PowerUp.scn")

var createPowerUp = false

func _ready():
	set_process(true)
	Globals.set("gameRunning", true)
	get_node("Timer").start()

func _process(delta):
	
	if createPowerUp == true:
		var newPowerUp = PowerUp.instance()
		add_child(newPowerUp)
		newPowerUp.set_owner(self)
		
		createPowerUp = false

func _on_Timer_timeout():
	if Globals.get("gameRunning") == true:
		createPowerUp = true
