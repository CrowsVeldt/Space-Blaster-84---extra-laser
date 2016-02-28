
extends KinematicBody2D

# add a pickup tp the game, add a way to switch lasertype when the pickup is aquired

var gamerunning = false

var maxspeed = 700
var accel = 20
var kinspeed = Vector2(0,0)
var shippadx = 58
var shippady = 120

var firepressed = false
var laser = preload("res://Scenes/Laser/Laser.scn")
var maser = preload("res://Scenes/Laser/Maser.scn")
var lasercount = 0
var lasertype = 1


func _ready():
	set_fixed_process(true)
	get_node(".").move_to(Vector2(540, 1450))
	#move_to(
	
func _fixed_process(delta):
	
	# variable for what kind of laser to shoot
	
	if Globals.get("gameRunning"):
		if (Input.is_action_pressed("ui_up")) or (Input.is_action_pressed("ui_down")) or (Input.is_action_pressed("ui_left")) or (Input.is_action_pressed("ui_right")):
			Globals.set("triggerThrustSound", true)
			if (Input.is_action_pressed("ui_up")):
				if kinspeed.y > -maxspeed:
					kinspeed += Vector2(0, -accel)
			if (Input.is_action_pressed("ui_down")):
				if kinspeed.y < maxspeed:
					kinspeed += Vector2(0, accel)
			if (Input.is_action_pressed("ui_left")):
				if kinspeed.x > -maxspeed:
					kinspeed += Vector2(-accel, 0)
			if (Input.is_action_pressed("ui_right")):
				if kinspeed.x < maxspeed:
					kinspeed += Vector2(accel, 0)
		else:
			kinspeed.x = lerp(kinspeed.x, 0, .03)
			kinspeed.y = lerp(kinspeed.y, 0, .03)
		
		move(kinspeed * delta)
		
		if (get_pos().x < shippadx):
			kinspeed.x = 0
			move_to(Vector2(shippadx, get_pos().y))
		
		if (get_pos().x > get_viewport().get_rect().size.x - shippadx):
			kinspeed.x = 0 
			move_to(Vector2(get_viewport().get_rect().size.x - shippadx, get_pos().y))
		
		if (get_pos().y < shippady):
			kinspeed.y = 0
			move_to(Vector2(get_pos().x, shippady))
		
		if (get_pos().y > get_viewport().get_rect().size.y - shippady):
			kinspeed.y = 0 
			move_to(Vector2(get_pos().x, get_viewport().get_rect().size.y - shippady))
		
		
		# Shoot lasers, the type depends on the lasertype variable
		if (Input.is_action_pressed("ui_select") and !firepressed):
			
			lasercount += 1
			var laserinstance = laser.instance()
			
			if (lasertype == 1):
				laserinstance = laser.instance()
			
			elif (lasertype == 2):	
				laserinstance = maser.instance()
				
			laserinstance.set_name("laser" + str(lasercount))
			add_child(laserinstance)
			laserinstance.set_owner(self)
			laserinstance.set_pos(get_pos() + Vector2(0,-92))
			get_node("laser" + str(lasercount) + "/KinematicBody2D").add_collision_exception_with(get_node("."))
		
	
		firepressed = Input.is_action_pressed("ui_select")
		
		
		
		
		if Input.is_action_pressed("ui_cancel"):
			kinspeed = Vector2(0, 0)
			gamerunning = false
		
		if get_node(".").is_colliding():
			if get_node(".").get_collider().is_in_group("Rock"):
				Globals.set("triggerRockSound", true)
				kinspeed = Vector2(0,0)
				Globals.set("gameLevel", false)
				lasertype = 1
			if get_node(".").get_collider().is_in_group("PowerUps"):
				get_node(".").get_collider().queue_free()
				get_node("Timer").start()
				lasertype = 2
				
				
			
			
	else:
		kinspeed = Vector2(0,0)
		get_node(".").move_to(Vector2(540, 1450))


func _on_Timer_timeout():
	lasertype = 1
