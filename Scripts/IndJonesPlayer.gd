extends Sprite2D


# start position, should be the center of the screen
var start_x : int 
var start_y : int

@export var scale_factor = 0.25

func _ready():
	scale.x = 1
	scale.y = 1

	
func _process(delta):
	if Input.is_action_just_pressed("Interact"):
		scale.x += scale_factor
		scale.y += scale_factor
		position.y += 10

