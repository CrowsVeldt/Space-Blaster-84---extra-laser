
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

var durability = 3
var points = 30


func _ready():
	set_fixed_process(true)
	set_pos(Vector2(rand_range(50, 1000), -50))
	apply_impulse(get_pos(), Vector2(0, 600))
	set_angular_velocity(rand_range(-5, 5))
	
func _fixed_process(delta):
	if Globals.has("gameRunning"):
		if Globals.get("gameRunning") == false:
			get_node(".").queue_free()
	if get_pos().y > 1920:
		get_node(".").queue_free()
	if durability <= 0:
		if Globals.has("gameScore"):
			Globals.set("gameScore", Globals.get("gameScore") + points)
			Globals.set("triggerRockSound", true)
			get_node(".").queue_free()