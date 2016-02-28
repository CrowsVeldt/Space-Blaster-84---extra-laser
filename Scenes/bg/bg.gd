
extends ParallaxBackground

# member variables here, example:
# var a=2
# var b="textvar"

var offset_loc = 0

func _ready():
	set_process(true)
	
	
func _process(delta):
	offset_loc = offset_loc + 150 * delta
	set_scroll_offset(Vector2(0, offset_loc))