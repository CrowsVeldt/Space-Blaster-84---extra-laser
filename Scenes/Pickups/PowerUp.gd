
extends KinematicBody2D

# 



func _ready():
	set_fixed_process(true)
	set_pos(Vector2(rand_range(50, 1000), -50))
	
	
func _fixed_process(delta):
	move(Vector2(0, 12))
	if Globals.has("gameRunning"):
		if Globals.get("gameRunning") == false:
			get_node(".").queue_free()
	if get_pos().y > 1920:
		get_node(".").queue_free()	
	




