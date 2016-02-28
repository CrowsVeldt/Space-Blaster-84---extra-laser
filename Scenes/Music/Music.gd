
extends Node

# member variables here, example:
# var a=2
# var b="textvar"

var menu = load("Scenes/Music/menu.ogg")

var lvl_1 = load("Scenes/Music/lvl_1.ogg")

var musicOn = true


func _ready():
	set_process_input(true)
	get_node("StreamPlayer").set_loop(true)
	get_node("StreamPlayer").set_stream(menu)
	get_node("StreamPlayer").play()
	
func set_music(music_selection):
	if get_node("StreamPlayer").is_playing():
		get_node("StreamPlayer").stop()
	if music_selection == "menu":
		get_node("StreamPlayer").set_stream(menu)
	elif music_selection == "lvl_1":
		get_node("StreamPlayer").set_stream(lvl_1)
	if musicOn == true:
		get_node("StreamPlayer").play()

func _input(event):
	if event.is_action("ui_sound") && event.is_pressed() && !event.is_echo():
		if get_node("StreamPlayer").is_playing():
			get_node("StreamPlayer").stop()
			musicOn = false
		elif !get_node("StreamPlayer").is_playing():
			get_node("StreamPlayer").play()
			musicOn = true