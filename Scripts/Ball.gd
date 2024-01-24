extends Sprite2D

@export var scale_factor = 0.001

func _ready():
	pass
	
func _process(delta):
	scale.x += scale_factor # should it be multiplied by delta??
	scale.y += scale_factor 
