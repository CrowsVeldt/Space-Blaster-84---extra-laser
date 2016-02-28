
extends Node


var score = 0
var highScore = 0

func _ready():
	set_process(true)
	Globals.set("gameRunning", false)
	Globals.set("gameScore", score)
	Globals.set("gameLevel", false)
	
#Get input from the user to start or stop the game
func _process(delta):
	if Input.is_action_pressed("ui_quit"):
		get_tree().quit()
		
	if Globals.get("gameRunning") == true:
		run_game(delta)
	else:
		if Input.is_action_pressed("ui_accept"):
			start_game()
		
#Load the game
func start_game():
	print("started game")
	score = 0
	get_node("HUD root").set_Score(score)
	get_node("Info").set_text("Running")
	get_node("HUD root").set_Running()
	get_node("music_root").set_music("lvl_1")
	Globals.set("gameLevel", true)
	Globals.set("gameRunning", true)
	Globals.set("gameScore", 0)
	
	
	
#Running Loop
func run_game(delta):
	if Globals.get("gameScore") > score:
		score = Globals.get("gameScore")
		get_node("HUD root").set_Score(score)
		
	if Input.is_action_pressed("ui_cancel") or Globals.get("gameLevel") == false:
		Globals.set("gameRunning", false)
		get_node("music_root").set_music("menu")
		get_node("Info").set_text("Game Over")
		if score >= highScore:
			highScore = score
		get_node("HUD root").set_Game_Over(highScore)
		
	#if Input.is_action_pressed("ui_select"):
		#score = score + 1
		#get_node("HUD root").set_Score(score)