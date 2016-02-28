
extends SamplePlayer

# member variables here, example:
# var a=2
# var b="textvar"
var thrustPlaying = false
var thrustVoiceNum = null

func _ready():
	set_process(true)
	Globals.set("triggerLaserSound", false)
	Globals.set("triggerRockSound", false)
	Globals.set("triggerThrustSound", false)

func _process(delta):
	if Globals.get("triggerLaserSound"):
		play("shoot_small", false)
		Globals.set("triggerLaserSound", false)
		
	if Globals.get("triggerRockSound"):
		play("explosion", false)
		Globals.set("triggerRockSound", false)
		
	if Globals.get("triggerThrustSound"):
		if thrustPlaying == false:
			thrustVoiceNum = play("thrust", false)
			thrustPlaying = true
		Globals.set("triggerThrustSound", false)
	else:
		if thrustPlaying == true:
			thrustPlaying = false
			stop(thrustVoiceNum)