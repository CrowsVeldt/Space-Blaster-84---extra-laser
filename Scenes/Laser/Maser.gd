
extends Node

# member variables here, example:
# var a=2
# var b="textvar"

var speed = -1920

func _ready():
	Globals.set("triggerLaserSound", true)
	set_fixed_process(true)
	
func _fixed_process(delta):
	get_node("KinematicBody2D").move(Vector2(0,speed * delta))
	if get_node("KinematicBody2D").get_global_pos().y < 0 or get_node("KinematicBody2D").is_colliding():
		if get_node("KinematicBody2D").is_colliding():
			if get_node("KinematicBody2D").get_collider().is_in_group("Rock"):
				get_node("KinematicBody2D").get_collider().durability -= 2
		get_node(".").queue_free()
		
		
func set_pos(thepos):
	get_node("KinematicBody2D").set_pos(Vector2(thepos))
