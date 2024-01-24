extends Node

var score # the actual player score ( may be the number of minigames passed? )
var ind_jones # Number of indiana jones minigame apppearances
var star_wars # Number of star wars minigame appearances
# One minigame left for designing and thinking...
var third_minigame

# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	ind_jones = 0
	star_wars = 0
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
