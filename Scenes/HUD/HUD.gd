
extends Node

# member variables here, example:
# var a=2
# var b="textvar"


func _ready():
	# Initialization here
	pass
	
func set_Game_Over(HighScore):
	get_node("gameover").set_text("GAME OVER!\n\n\nHigh Score:\n\n0" + str(HighScore) + "\n\n\nPress Enter to\n\nPlay Again!")
	get_node("gameover").show()
	
func set_Running():
	get_node("gameover").hide()
	get_node("menu_startup").hide()
	
func set_Score(Score):
	get_node("score").set_text("Score: 0" + str(Score))